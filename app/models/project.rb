class Project < ActiveRecord::Base

  self.inheritance_column = nil

  belongs_to :customer
  has_many :project_items
  has_many :inventory_items, through: :project_items
  has_many :inventory_styles, through: :inventory_items
  has_many :emails
  has_many :notes
  has_many :attachments

  #Validations 
  validates_presence_of :name, :type, :stage, :customer_id, :rental_delivery, :rental_pickup

end
