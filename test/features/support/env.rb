require 'rubygems'
require 'phantomjs'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'capybara/rspec'
require 'httparty'
require 'byebug'

Capybara.configure do |config|
    config.run_server = false
    config.javascript_driver = :poltergeist
    config.default_max_wait_time = 5
    config.ignore_hidden_elements = false
end

Capybara.register_driver :poltergeist do |app|
    poltergeist = Capybara::Poltergeist::Driver.new(app, :phantomjs => '/opt/phantomjs/bin/phantomjs', :window_size => [1920, 1080])
    poltergeist.headers = { 'User-Agent' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36' }
    poltergeist
end