source 'http://nexus.in.spdigital.io/repository/rubygems-all/'

ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'dotenv-rails'
gem 'http'
gem 'pg'
gem 'puma'
gem 'rails'

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-github'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
