json.inventory_style do
  json.id @inventory_style.id
  json.name    @inventory_style.name
  json.manufacturer @inventory_style.manufacturer
  json.model_number @inventory_style.model_number
  json.color @inventory_style.color
  json.inventory_items @inventory_style.inventory_items
end