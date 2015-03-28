json.project do
  json.id @project.id
  json.name @project.name
  json.type @project.type
  json.stage @project.stage
  json.customer_id @project.customer_id
  json.sale_delivery @project.sale_delivery
  json.rental_delivery @project.rental_delivery
  json.rental_pickup @project.rental_pickup
  json.project_items @project.project_items
  json.emails @project.emails
  json.notes @project.notes
  json.attachments @project.attachments
end