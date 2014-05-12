Given /^I visit the home page$/ do
  visit '/'
end

Given /^I sign in$/ do
  user = FactoryGirl.create(:user, email: 'sample@sample.com', password: 'password')
  login(user)
end

Given /^I fill in '(.*)' for '(.*)'$/ do |value, field|
  fill_in(field, :with => value)
end

#Given /^I add a new todo with title '(.*)'$/ do |title|
#  visit '/'
#  create_todo(title)
#end

Given /^User with email '(.*)' and password '(.*)' exists$/ do |email, password|
  FactoryGirl.create(:user, email: email, password: password)
end

Given /^Todo with title '(.*)' exists$/ do |title|
  FactoryGirl.create(:todo, title: title)
end

Given /^Archived todo with title '(.*)' exists$/ do |title|
  FactoryGirl.create(:todo, title: title, status: :archived)
end

When /^I click the done button for first todo$/ do
  todo = first('.new-todo')
  todo.find('.done').click
end

When /^I press '(.*)'$/ do |name|
  click_button(name)
end

When /^I click '(.*)'$/ do |text|
  click_link(text)
end

Then /^I should see the new todo '(.*)'$/ do |title|
  #body.should match(/#{text}/m)
  page.should have_selector('.panel-title', :text => title)
end

Then /^I should see '(.*)' is done$/ do |title|
  page.should have_selector('.list-group-item-heading', :text => title)
  page.should_not have_selector('.panel-title', :text => title)
end

Then /^I should see '(.*)' is not done$/ do |title|
  page.should_not have_selector('.list-group-item-heading', :text => title)
  page.should have_selector('.panel-title', :text => title)
end

Then /^I should see the text '(.*)'$/ do |text|
  page.should have_text(text)
end

Then /^I should not see the text '(.*)'$/ do |text|
  page.should_not have_text(text)
end



#When /^I drag '(.*)' to done area$/ do |title|
#  src = find('.new-todo')
#  dest = find("#finished_todos")
#  src.drag_to(dest)
#end