
class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :first_name, :last_name, :country, :birthdate,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password, presence: true, length: {minimum: 6}
  validates :email, presence: true , format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }




  def mess
      require 'uri'
      require "net/http"
     
      p = {"first-name"=>"Tamara", "last-name"=>"", "birth-date"=>"/Date(-1059609600000)/", "country"=>"46", "email"=>"", "password"=>"vxcvcv", "afid"=>"", "subafid"=>"", "current-language"=>""} 
      x = Net::HTTP.post_form(URI.parse('https://www.amolatina.com/member/register/?'), p)
      
      @message = ['fFFFFFFFFF']
      puts self
      puts "FFFFFFFFFF"
      puts x.body
  end
end
