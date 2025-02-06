source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem 'enumerate_it'
gem 'font-awesome-rails', '4.7.0.9'
gem 'kaminari', '>= 1.2.2'
gem 'pg', '~> 1.3.5'
gem 'puma', '~> 6.6'
gem 'rails', '7.0.8.7'
gem 'simple_form', '~> 5.3'
gem 'sprockets-rails'
gem 'jsbundling-rails'
gem 'cssbundling-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'
gem 'view_component', '~> 2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot', '6.2.1'
  gem 'factory_bot_rails', '6.2.0'
  gem 'faker', require: false
  gem 'rspec-rails', '~> 5.1.0'
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'capybara', '~> 3.40'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'simplecov', '~> 0.13.0', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-rails', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
