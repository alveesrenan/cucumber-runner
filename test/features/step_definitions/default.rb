When(/^I wait (\d+) seconds/) do |seconds|
  sleep(seconds.to_i)
end

When(/^I take screenshot and set filename "([^"]*)"$/) do |filename|
 page.save_screenshot("./features/screenshots/"+filename+".png", full: true)
end