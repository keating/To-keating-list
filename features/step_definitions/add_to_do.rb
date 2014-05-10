Given /^I visit the home page$/ do
  visit '/'
end

Given /^I fill in '(.*)' for '(.*)'$/ do |value, field|
  fill_in(field, :with => value)
end

Given /^I add a new todo with title '(.*)'$/ do |title|
  visit '/'
  create_todo(title)
end

Given /^Todo with title '(.*)' exists$/ do |title|
  FactoryGirl.create(:todo, title: title)
end

When /^I click the done button for first todo$/ do
  todo = first('.new-todo')
  todo.find('.done').click
end

When /^I press '(.*)'$/ do |name|
  click_button(name)
end

Then /^I should see the new todo '(.*)'$/ do |title|
  #body.should match(/#{text}/m)
  page.should have_selector('.panel-title', :text => title)
end

Then /^I should see '(.*)' is finished/ do |title|
  page.should have_selector('.list-group-item-heading', :text => title)
  page.should_not have_selector('.panel-title', :text => title)
end

#When /^I drag '(.*)' to finished area$/ do |title|
#  src = find('.new-todo')
#  dest = find("#finished_todos")
#  src.drag_to(dest)
#end