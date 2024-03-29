
Given /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Given /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should be on (.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should see '([^']*)'$/ do |text|
  page.should have_content(text)
end

When /^I follow "([^"]*)"$/ do |link|
  click_link(link)
end

