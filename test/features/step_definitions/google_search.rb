Then(/^I should see my blog in the first result$/) do
  page.all('.s')[1].find('cite', :class => '_Rm').text.should include("fabiohbarbosa")
end