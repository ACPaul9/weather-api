source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3"

gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "httparty"
gem "delayed_job_active_record"
gem "rufus-scheduler"
gem "daemons"
gem "data_migrate"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "pry-rails"
  gem "rspec-rails"
  gem "vcr"
  gem "webmock"
  gem "rswag-specs"
end

group :development do
end
