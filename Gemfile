source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'

# DB
group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
end

# Images
gem 'mini_magick', '~> 4.8'
gem 'carrierwave', '~> 1.1'

# Templates and assets
gem 'slim', '~> 3.0', '>= 3.0.8'
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'alertifyjs-rails', '~> 1.11'
gem 'uglifier', '>= 1.3.0'
gem 'react-rails', '~> 2.2', '>= 2.2.1'
gem 'active_model_serializers', '~> 0.10.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'pry-rails'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
