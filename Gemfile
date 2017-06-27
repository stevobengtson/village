# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.9.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'

gem 'devise', '~> 4.3'
gem 'pundit', '~> 1.1.0'

gem 'redis-rails', '~> 5.0', '>= 5.0.2'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap_form', '~> 2.7'
gem 'jquery-rails', '~> 4.3.1'

gem 'kaminari', '~> 1.0.1'

gem 'librarian-puppet'
gem 'puppet'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Better console
  gem 'pry-byebug', '~> 3.4', '>= 3.4.2'
  gem 'pry-coolline', '~> 0.2.5'
  gem 'pry-inline', '~> 1.0', '>= 1.0.3'
  gem 'pry-nav', '~> 0.2.4'
  gem 'pry-rails', '~> 0.3.6'
  gem 'pry-remote', '~> 0.1.8'

  gem 'colorize', '~> 0.8.1'
  gem 'faker', '~> 1.7', '>= 1.7.3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rvt', '~> 1.0'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'fast_stack'
  gem 'flamegraph'
  gem 'memory_profiler'
  gem 'rack-mini-profiler'
  gem 'stackprof'

  gem 'any_login', '~> 1.2.2'

  gem 'rubocop', '~> 0.49.1', require: false
end

group :test do
  gem 'capybara', '~> 2.13'
  gem 'mocha', '~> 1.2.1'
  gem 'selenium-webdriver', '~> 3.4.3'
  gem 'simplecov', '~> 0.14.1', require: false
  gem 'simplecov-json', '~> 0.2', require: false
end
