Given(/^I have a "(.*?)" with a "(.*?)" "(.*?)"$/) do |arg1, arg2, arg3|
  arg1.constantize.create(arg2.to_sym => arg3)
end

When(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content arg1
end

When(/^I (press|click) "(.*?)"$/) do |w, arg1|
  click_link_or_button arg1
end

When(/^fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, :with => arg2
end


Then(/^I should be on the homepage$/) do
  current_path.should eq '/'
end