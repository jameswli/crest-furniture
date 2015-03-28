json.inventory_items @inventory_items do |i|
  json.(i,:id, :serial_number, :status, :condition, :inventory_style_id)
end