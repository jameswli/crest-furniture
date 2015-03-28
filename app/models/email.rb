class Email < ActiveRecord::Base

  belongs_to :project
  belongs_to :customer
end
