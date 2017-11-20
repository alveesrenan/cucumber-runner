require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/rspec'

Capybara.configure do |config|
  config.run_server = false
  config.javascript_driver = :chrome
  config.default_max_wait_time = 5
  config.ignore_hidden_elements = false
end

Capybara.register_driver :chrome do |app|
  args = ['--window-size=1200,768', '--incognito', '--disable-gpu', "--no-sandbox"]
  if !ENV['DISPLAY']
    args.insert(-1, '--headless')
  end

  caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {
    'args' => args,
    'prefs' => { 'intl.accept_languages' => 'en-US' }
  })
  Capybara::Selenium::Driver.new(app, browser: :chrome, :driver_path => '/opt/chromedriver', desired_capabilities: caps)
end
