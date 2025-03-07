create function keepcoding.clean_integer(new_value INT)
returns INT
as (case
     when new_value is null then -999999
     else new_value
  end);