# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'pg', '>= 0.18', '< 2.0'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.2.0'

group :development, :test do
  gem 'awesome_print'
  gem 'byebug'
end

group :development do
  gem 'fuubar', require: false
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
end
