require 'rubygems'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'httparty'
require 'byebug'

Capybara.configure do |config|
  debugger
  config.run_server = false
  config.javascript_driver = :chrome
  config.default_max_wait_time = 5
  config.ignore_hidden_elements = false
end

Capybara.register_driver :chrome do |app|
  caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {
    'args' => ['--window-size=1200,768', '--headless', '--incognito', '--disable-gpu', "no-sandbox"],
    'prefs' => { 'intl.accept_languages' => 'en-US' }
  })
  Capybara::Selenium::Driver.new(app, browser: :chrome, :driver_path => '/opt/chromedriver', desired_capabilities: caps)
end
