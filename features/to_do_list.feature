Feature: to do list

  Scenario: add a to do list record
    Given I visit the home page
    And I fill in 'Reading the cucumber book' for 'todo_title'
    And I fill in 'Buy this book first' for 'todo_remark'
    When I press 'Create Todo'
    Then I should see 'Reading the cucumber book'

#  Scenario: finish a to do list record
#    Given I visit the home page
#    And I click the finish button of one record
#    Then The status of the record changes to finish
#
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