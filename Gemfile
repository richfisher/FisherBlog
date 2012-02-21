source 'http://ruby.taobao.org/'

gem 'rails', '~>3.2'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
gem "bson_ext"
gem 'mongoid'
gem 'mongoid_rails_migrations'
gem 'mongo-rails-instrumentation'

gem "carrierwave-mongoid", :require => 'carrierwave/mongoid'
gem "mini_magick"
gem "ckeditor" #require carrierwave-mongoid,mini_magick

#gem "nokogiri"
#gem "htmlentities"
#gem "truncate_html" #require htmlentities,nokogiri

gem 'cells'

gem 'kaminari'

gem 'devise'

gem 'syntax_highlighter-rails', :git => 'git://github.com/richfisher/syntax_highlighter-rails.git'

# Gems used only for assets and not required
# in production environments by default.
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails'
group :assets do
  gem 'haml-rails'
  gem 'sass-rails', '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'database_cleaner'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'mongoid-rspec'
  gem 'factory_girl_rails'
  gem 'spork-rails'
end

group :development, :test do
  gem 'watchr'

  gem 'guard'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'rb-inotify', :require => false if RUBY_PLATFORM =~ /linux/i
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-resque'
  gem 'guard-livereload'
end

group :development do
  gem 'capistrano'
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'execjs'
gem 'therubyracer'