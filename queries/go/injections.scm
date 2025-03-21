(short_var_declaration
  (expression_list
    (raw_string_literal) @sql
  )
  (#match? @sql "(select|insert|update|delete|with)")
)

