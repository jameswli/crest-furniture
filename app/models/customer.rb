class Customer < ActiveRecord::Base

  # Associations
  has_many :projects
  has_many :notes
  has_many :project_notes, through: :projects, source: :notes
  has_many :emails
  has_many :project_emails, through: :projects, source: :emails

  # Validations
  validates_associated :projects
  validates_associated :notes
  validates_associated :emails
  validates_presence_of :name, :organization, :email, :telephone, :cellphone, :address_line_1, :city, :state, :zip_code
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :name, minimum: 2
  validates_length_of :organization, in: 2..20
  validates_length_of :telephone, :cellphone, is: 10
  validates_length_of :address_line_1, in: 2..30
  validates_length_of :address_line_2, maximum: 20, allow_blank: true
  validates_length_of :city, in: 2..20
  validates_length_of :state, is: 2
  validates_length_of :zip_code, is: 5
  validates_numericality_of :telephone, :cellphone, :zip_code, only_integer: true

  def name_with_organization
    "#{name}, #{organization}"
  end
  	

  def location
    Geocoder.coordinates("#{self.address_line_1}, #{self.city}, #{self.state}, #{self.state}")
  end
end
