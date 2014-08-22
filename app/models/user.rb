
class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :first_name, :last_name, :country, :birthdate,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password, presence: true, length: {minimum: 6}
  validates :email, presence: true , format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }




  def mess
      require 'uri'
      require "net/http"
      sites = self.sites
      
      p = {"first-name"=>"Tamara", "last-name"=>"", "birth-date"=>"/Date(-1059609600000)/", "country"=>"46", "email"=>"love_tamara@mail.ru", "password"=>"vxcvcv", "afid"=>"", "subafid"=>"", "current-language"=>""} 
      sites.each do |site|
         response = Net::HTTP.post_form( URI.parse(site.first), site.last )
         puts '###' * 10
         puts self
         puts response.body
         puts '###' * 10  
      end 
  end



  def sites 
    anas_url = "http://api.anastasiadate.com/member/register/?clientside-id=&afid=&subafid=&source=anastasiadate.us&current-language=&offer-id=&transaction-id="
    anas_data = {"afid" => "", 
                 "subafid" => "", 
                 "current-language" => ""
                 
                }
    anastasiadate =[anas_url,  anas_data]
    
    braz_url = "http://api.amolatina.com/member/register/?clientside-id=&afid=&subafid=&source=braziliawomen.com&current-language=&offer-id=&transaction-id="
    braz_data = {"afid" => "",
                 "subafid" => ""
                 
                }
    braziliawomen = [braz_url, braz_data]

    asia_url = "http://api.asiandate.com/member/register/?clientside-id=1407935339330245&afid=20102&subafid=18957&source=asiandate.co&current-language=&offer-id=22&transaction-id=1029c1a30454b1367025c1e55addeb"
    asia_data = {"afid" => "20102","subafid" => "18957",
                 "family-coregistration" => true
                }
    asiadate = [asia_url, asia_data]


    

    sites = [anastasiadate, braziliawomen, asiadate]
    #sites = [anastasiadate]
    attrs = [:country, :email, :password]
    sites.map  do |site|
      site = site.last
      site['first-name'] = self.first_name 
      site['last-name']  = self.last_name
      site['birth-date'] = self.birthdate
      attrs.map do |atr| 
        site[atr.to_s] = self.send atr 
      end
    
    end
    sites
  end
end
