class User < ActiveRecord::Base
  # acts_as_token_authenticatable
  before_save :create_new_token
  # Other modules: :confirmable, :registerable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  def generate_authentication_token
    self.authentication_token = SecureRandom.hex
    save!
  end

  def create_new_token
    self.authentication_token = SecureRandom.hex
  end

end
