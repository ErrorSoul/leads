FactoryGirl.define do 
  factory :user do
    first_name "Orwald"
    last_name  "Smith"
    email     "orwald_smith@mail.ru"
    password  "orwaldthebest"
    country   "46"
    birthdate "/Date(92922222)/"
  end


   factory :invalid_user_email, parent: :user do |z|
    z.email  nil 
  end
end
    
