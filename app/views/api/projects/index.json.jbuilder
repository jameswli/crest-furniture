json.projects @projects do |p|
  json.(p, :id, :name, :type, :stage, :customer_id, :sale_delivery, :rental_delivery, :rental_pickup)
end