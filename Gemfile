source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'foundation-rails', '~> 6.3'
gem 'devise', '~> 4.2'
gem 'devise-i18n', '~> 1.1'
gem 'simple_form', '~> 3.2', '>= 3.2.1'
gem 'gibbon', '~> 2.2', '>= 2.2.4'
gem 'paperclip', '~> 5.0'
gem 'aws-sdk', '~> 2.3', '>= 2.3.22'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'sendgrid-ruby', '~> 4.0', '>= 4.0.6'
gem 'cancancan', '~> 1.13', '>= 1.13.1'
gem 'font-awesome-sass', '~> 4.6', '>= 4.6.2'
gem 'wkhtmltopdf-binary'
gem 'pdfkit', '~> 0.8.2'
gem 'render_anywhere', '~> 0.0.12'
gem 'httparty'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rails', '~> 0.3.2'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
  gem 'binding_of_caller'
  gem 'better_errors'
end

group :test do
  #gem 'capybara-email'
  #gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker' #some older RubySnacks reference 'ffaker'
  gem 'rspec-rails'
  gem 'simple_bdd'
  gem 'shoulda-matchers'
end 

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
