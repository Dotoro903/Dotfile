#!/usr/bin/env bash
set -euo pipefail

BUF_WS=99

mapfile -t mons < <(hyprctl monitors -j | jq -r '.[].name')

if ((${#mons[@]} < 2)); then
    echo "Need 2 monitors. Found: ${#mons[@]}"
    hyprctl monitors -j | jq -r '.[].name' || true
    exit 1
fi

MAIN_MON="${mons[0]}"
SUB_MON="${mons[1]}"

ws_of_mon() {
    local mon="$1"
    hyprctl monitors -j |
        jq -er --arg m "$mon" '.[] | select(.name==$m) | .activeWorkspace.id'
}

# --- window address helpers ---
get_ws_addrs() {
    local ws="$1"
    hyprctl clients -j |
        jq -r --arg w "$ws" '.[] | select(.workspace.id == ($w|tonumber)) | .address'
}

# Old syntax: hyprctl dispatch movetoworkspace "$to,address:$a"
# That raw dispatcher-string form no longer executes under a Lua config
# (same issue Waybar hit: https://github.com/Alexays/Waybar/issues/5008).
# hyprctl now needs the hl.dsp.* call passed as a Lua expression string.
move_addrs_to_ws() {
    local to="$1"
    shift
    local a
    for a in "$@"; do
        hyprctl dispatch "hl.dsp.window.move({ workspace = \"$to\", window = \"address:$a\" })" >/dev/null
    done
}

swap_ws_contents() {
    local ws_a="$1" ws_b="$2" buf_ws="$3"
    mapfile -t a_addrs < <(get_ws_addrs "$ws_a")
    mapfile -t b_addrs < <(get_ws_addrs "$ws_b")
    local a_n=${#a_addrs[@]}
    local b_n=${#b_addrs[@]}

    # both empty -> nothing
    if ((a_n == 0 && b_n == 0)); then
        return 0
    fi

    # A empty, B non-empty -> move B -> A
    if ((a_n == 0 && b_n > 0)); then
        move_addrs_to_ws "$ws_a" "${b_addrs[@]}"
        return 0
    fi

    # B empty, A non-empty -> move A -> B
    if ((b_n == 0 && a_n > 0)); then
        move_addrs_to_ws "$ws_b" "${a_addrs[@]}"
        return 0
    fi

    # both non-empty -> true swap via buffer
    move_addrs_to_ws "$buf_ws" "${a_addrs[@]}"
    move_addrs_to_ws "$ws_a" "${b_addrs[@]}"

    # move old A (now in buffer) -> B
    mapfile -t buf_addrs < <(get_ws_addrs "$buf_ws")
    if ((${#buf_addrs[@]} > 0)); then
        move_addrs_to_ws "$ws_b" "${buf_addrs[@]}"
    fi
}

FOCUSED_ADDR="$(hyprctl activeworkspace -j | jq -r '.monitorID')"
WS_A="$(ws_of_mon "$MAIN_MON" || true)"
WS_B="$(ws_of_mon "$SUB_MON" || true)"

if [[ -z "$WS_A" || -z "$WS_B" ]]; then
    echo "Could not resolve active workspaces."
    echo "MAIN_MON='$MAIN_MON' SUB_MON='$SUB_MON'"
    echo "Available monitors:"
    hyprctl monitors -j | jq -r '.[].name' || true
    exit 1
fi

swap_ws_contents "$WS_A" "$WS_B" "$BUF_WS"

# --- restore focus (focus follows the moved window) ---
# Old syntax: hyprctl dispatch focusmonitor "$FOCUSED_ADDR"
# Same fix as above -- FOCUSED_ADDR is actually a monitor ID (despite the
# variable name), so this targets focus by monitor ID.
if [[ -n "$FOCUSED_ADDR" ]]; then
    hyprctl dispatch "hl.dsp.focus({ monitor = \"$FOCUSED_ADDR\" })" > /dev/null
fi
