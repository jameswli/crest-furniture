json.customer do
  json.name @customer.id
  json.name @customer.name
  json.organization @customer.organization
  json.email @customer.email
  json.telephone @customer.telephone
  json.cellphone @customer.cellphone
  json.address_line_1 @customer.address_line_1
  json.address_line_2 @customer.address_line_2
  json.city @customer.city
  json.state @customer.state
  json.zip_code @customer.zip_code
  json.projects @customer.projects
  json.notes @customer.notes
  json.emails @customer.emails
end