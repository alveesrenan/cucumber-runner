Given(/^I am on the homepage "([^"]*)"$/) do |url|
  visit url
end

Then(/^I should see the title "([^"]*)"$/) do |title|
  page.should have_css('title', :text => title)
end

When(/^I fill field "([^"]*)" with "([^"]*)"$/) do |id_class, text|
  find(id_class).set(text)
end

When(/^I click on the button "([^"]*)"$/) do |id_class|
  find(id_class).click
end