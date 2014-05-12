Given /^I visit the home page$/ do
  visit '/'
end

Given /^I sign in$/ do
  user = FactoryGirl.create(:user, email: 'sample@sample.com', password: 'password')
  login(user)
end

Given /^I sign in as the first user$/ do
  login(User.first)
end

Given /^I fill in '(.*)' for '(.*)'$/ do |value, field|
  fill_in(field, :with => value)
end

Given /^User with email '(.*)' and password '(.*)' exists$/ do |email, password|
  FactoryGirl.create(:user, email: email, password: password)
end

Given /^User with two todos '(.*)' and '(.*)' exists$/ do |active_todo, archived_todo|
  user = FactoryGirl.create(:user, email: 'sample@sample.com', password: 'password')
  FactoryGirl.create(:todo, title: active_todo, user: user)
  FactoryGirl.create(:todo, title: archived_todo, status: :archived, user: user)
end

Given /^User with active todo '(.*)' exists$/ do |active_todo|
  user = FactoryGirl.create(:user, email: 'sample@sample.com', password: 'password')
  FactoryGirl.create(:todo, title: active_todo, user: user)
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
  sleep 1
  page.should have_text('New Todo')
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