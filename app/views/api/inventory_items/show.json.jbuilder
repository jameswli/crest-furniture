json.inventory_item do
  json.id @inventory_item.id
  json.serial_number    @inventory_item.serial_number
  json.status @inventory_item.status
  json.condition @inventory_item.condition
  json.inventory_style_id @inventory_item.inventory_style_id
  json.project_items @inventory_item.project_items
  json.projects @inventory_item.projects
end