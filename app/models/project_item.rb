class ProjectItem < ActiveRecord::Base

  belongs_to :project
  belongs_to :inventory_item

  validates_presence_of :project, strict: true
  validates_presence_of :inventory_style
  validate :inventory_item_is_available
  validates_presence_of :inventory_item

  def inventory_style=(inventory_style)
    @inventory_style = inventory_style
  end

  def inventory_style
    if self.inventory_item.blank?
      @inventory_style
    else
      self.inventory_item.try(:inventory_style)
    end
  end

  private

  # It's probably not regular for validations to change data, so heads up: this validation sets inventory_item
  def inventory_item_is_available
  	if self.inventory_item.present? && self.inventory_item.is_available?(project.rental_delivery, project.rental_pickup) == false
  		errors.add(:inventory_item, "is not available within this project's duration")
  	elsif self.inventory_item.blank?
  		self.inventory_item = inventory_style.find_available(project.rental_delivery, project.rental_pickup)
  		errors.add(:inventory_style, "has no available items within this project's duration") if self.inventory_item.blank?
  	end
  end

end
