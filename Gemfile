source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1', '>= 5.1.1'
gem 'pg', '~> 0.20.0'
gem 'puma', '~> 3.9', '>= 3.9.1'
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
gem 'uglifier', '~> 3.2'
gem 'turbolinks', '~> 5.0', '>= 5.0.1'
gem 'slim-rails', '~> 3.1', '>= 3.1.2'
gem 'jquery-rails', '~> 4.1', '>= 4.1.1'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'interactor-rails', '~> 2.0', '>= 2.0.1'
gem 'cocoon', '~> 1.2', '>= 1.2.10'

group :development, :test do
  gem 'pry-rails', '~> 0.3.6'
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_girl_rails', '~> 4.5'
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
end

group :development do
  gem 'listen', '~> 3.1', '>= 3.1.5'
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end
