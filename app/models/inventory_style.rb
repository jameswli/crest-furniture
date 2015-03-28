class InventoryStyle < ActiveRecord::Base
  mount_uploader :picture, InventoryStylePictureUploader
  
  has_many :inventory_items

  def find_available(start_date, end_date)
  	inventory_items.each do |i|
  		return i if i.is_available?(start_date, end_date)
  	end
  	return nil
  end

  def number_available(start_date, end_date)
  	number = 0
  	inventory_items.each do |i|
  		number += 1 if i.is_available(start_date, end_date)
  	end
  	return number
  end

end
