Feature: to do list

  Scenario: not login
    Given I visit the home page
    Then I should not see the text 'New Todo'

  Scenario: login
    Given User with email 'sample@sample.com' and password 'password' exists
    And I visit the home page
    And I click 'Sign in'
    And I fill in 'sample@sample.com' for 'user_email'
    And I fill in 'password' for 'user_password'
    When I press 'Sign in'
    Then I should see the text 'New Todo'

  Scenario: add a todo
    Given I sign in
    And I fill in 'Reading the cucumber book' for 'todo_title'
    And I fill in 'Buy this book first' for 'todo_remark'
    When I press 'Create Todo'
    Then I should see the new todo 'Reading the cucumber book'

  @javascript
  Scenario: finish a todo
    Given User with active todo 'Go home' exists
    And I sign in as the first user
    When I click the done button for first todo
    Then I should see 'Go home' is done

  Scenario: new todos is on left
    Given User with two todos 'Go to office' and 'Go home' exists
    And I sign in as the first user
    Then I should see 'Go home' is done
    Then I should see 'Go to office' is not done

#  Scenario: remove a to do list record
#    Given I visit the home page
#    And I click the remove button of one record
#    And I click sure on the up confirm dialog
#    Then The to do list record should be removed
#
#  Scenario: archive a finished to do list record
#    Given I visit the home page
#    And I click the archive button on a finished to do list record
#    And I click sure on the up confirm dialog
#    Then The to do list record should be archived
#
#  Scenario: undo a to do list record
#    Given I visit the home page
#    And I click the undo button on a finished to do list record
#    Then The status of this record should be changed to new