Feature: to do list

  Scenario: add a todo
    Given I visit the home page
    And I fill in 'Reading the cucumber book' for 'todo_title'
    And I fill in 'Buy this book first' for 'todo_remark'
    When I press 'Create Todo'
    Then I should see the new todo 'Reading the cucumber book'

  @javascript
  Scenario: finish a todo
    Given Todo with title 'Go home' exists
    And I visit the home page
    When I click the done button for first todo
    Then I should see 'Go home' is done

  Scenario: new todos is on left
    Given Archived todo with title 'Go home' exists
    And Todo with title 'Go to office' exists
    And I visit the home page
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