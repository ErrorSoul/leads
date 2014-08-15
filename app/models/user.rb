class User < ActiveRecord::Base
  validates :first_name, :last_name, :country, :birthdate,  presence: true

  validates :password, presence: true, length: {minimum: 6}
  validates :email, presence: true 
end
