source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.7'



# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'haml'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'delayed_job_active_record'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end



group :test do

  gem "pry"
  
 
  gem 'factory_girl_rails'
  
end
group :development do
  

  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
end
group :development, :test do
  
  gem 'rspec-rails', '2.13.1'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
 

   # Guard
  gem 'guard-jasmine'

  gem "guard-rails", ">= 0.4.0"
  gem "guard-rspec", ">= 2.5.2"
  



   # Jasmine

gem "jasmine-rails"
gem "jasmine", '~> 1.3.1'

end

group :production do
 
  gem 'rails_12factor'
end
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
