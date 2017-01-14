source 'https://rubygems.org'
ruby '2.3.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.1'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails', '~> 3.0', '>= 3.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 3.0'
gem 'bcrypt', '~> 3.1.7'
gem 'rails-i18n', '~> 4.0.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails', '~> 0.3.4'
  gem 'pry-byebug', '~> 3.4', '>= 3.4.2'
  gem 'pry-stack_explorer', '~> 0.4.9.2'
  gem 'pry-doc', '~> 0.10.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
end

group :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'spring-commands-rspec', '~> 1.0.4'
  gem 'capybara', '~> 2.11.0'
  gem 'factory_girl', '~> 4.8.0'
  gem 'database_cleaner', '~> 1.5.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
