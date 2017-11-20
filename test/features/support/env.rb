require 'rubygems'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'httparty'
require 'byebug'

Capybara.configure do |config|
  config.run_server = false
  config.javascript_driver = :chrome
  config.default_max_wait_time = 5
  config.ignore_hidden_elements = false
end

Capybara.register_driver :chrome do |app|
  args = ['--window-size=1200,768', '--headless', '--incognito', '--disable-gpu', "--no-sandbox"]
  if ENV['DISPLAY']
    args = ['--window-size=1200,768', '--incognito', '--disable-gpu', "--no-sandbox"]
  end

  caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {
    'args' => args,
    'prefs' => { 'intl.accept_languages' => 'en-US' }
  })
  Capybara::Selenium::Driver.new(app, browser: :chrome, :driver_path => '/opt/chromedriver', desired_capabilities: caps)
end
