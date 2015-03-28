source 'https://rubygems.org'
ruby '2.1.5'

# Gems required by Rails and Heroku

gem 'rails', '4.1.6'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

group :development do
	gem 'therubyracer', platforms: :ruby
	gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
end

group :production do
	gem 'rails_12factor'
	gem 'unicorn'
end

# Gems used by our app

gem 'kaminari'
gem 'devise', '~> 3.4.1'
gem 'fog', '~> 1.27.0', require: 'fog/aws/storage'
gem 'carrierwave', '~> 0.10.0'
gem 'simple_token_authentication', '~> 1.0'
gem 'jquery-ui-rails'
gem 'kramdown', '~> 1.6.0'
gem 'prawn', '~> 2.0.0' # needed for kramdown PDF generation
gem 'prawn-table', '~> 0.2.1' # needed for kramdown PDF generation

gem 'geocoder'