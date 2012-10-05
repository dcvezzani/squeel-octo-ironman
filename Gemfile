source 'https://rubygems.org'

# gem 'rails',     :git => 'git://github.com/rails/rails.git'
gem 'rails', '3.2.8'
#gem 'delayed_job_active_record'

gem 'squeel'
# gem 'sqlite3'
gem 'pg'
#gem 'texticle', "2.0", :require => 'texticle/rails'
gem 'texticle', :require => 'texticle/rails', :git => "git://github.com/texticle/texticle.git"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem "devise", ">= 2.1.0"
gem "cancan"
gem 'role_model'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'
gem 'thin'

# image support
gem 'carrierwave'
gem 'cloudinary'

# email support
gem 'gibbon'

# Deploy with Capistrano
# gem 'capistrano'

group :development do
  gem "nifty-generators", :git => 'git://github.com/dcvezzani/nifty-generators.git'
end

group :test do
  gem "email_spec", ">= 1.2.1"
  gem "cucumber-rails", ">= 1.3.0", :require => false
  gem "capybara", ">= 1.1.2"
  #gem 'capybara', git: 'https://github.com/jnicklas/capybara.git'
  gem "database_cleaner", ">= 0.7.2"
  gem "launchy", ">= 2.1.0"
  gem "minitest"

  # Pretty printed test output
  gem 'turn', :require => false
end

group :development, :test do
  gem "rspec-rails", ">= 2.10.1"
  gem "factory_girl_rails", ">= 3.3.0"
  #gem "factory_girl_rails", ">= 3.3.0", :require => false
  #gem 'factory_girl', ">= 3.3.0", :require => false
  gem 'guard'

  #gem "spork", "> 0.9.0.rc"
  gem "spork", "= 1.0.0rc3"
  gem "guard-spork"
  gem 'rb-fsevent' #, :require => false if RUBY_PLATFORM =~ /darwin/i # so that Guard can detect file changes on OS X (Mac)
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'guard-cucumber'
  gem 'capybara-rails-log-inspection', :git => "https://github.com/johnbintz/capybara-rails-log-inspection.git"

# To use debugger
  # gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'debugger'
end


# gem "mocha", :group => :test
