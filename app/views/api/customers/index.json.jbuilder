json.customers @customers do |c|
  json.(c,:id, :name, :organization, :email, :telephone, :cellphone, :address_line_1, :address_line_2, :city, :state, :zip_code)
end