(script_element
  (start_tag
    (tag_name) @tag
    (attribute
      (attribute_name) @name
      (quoted_attribute_value (attribute_value) @val)))
  (raw_text) @injection.content
  (#eq? @tag "script")
  (#eq? @name "type")
  (#any-of? @val "text/babel" "application/babel" "text/jsx" "application/jsx")
  (#set! injection.language "javascript"))

