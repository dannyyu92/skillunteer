	Feature: delete charity from the website

	As a user
	So that the list of charities can be edited
	I want to delete a charity from the site

	Scenario: view charities
		When I go to the home page
		And I press "View Charities"
		Then I should be on the "charities" page

	Scenario: navigate to a charity
		When I go to the "charities" page
		And I press "charities/1/edit"
		Then I should be on the "charities/1/edit" page
		And I should see "Delete"

	Scenario: successfully delete charity from data base
		When I go to the "edit" page
		And I press "delete"
		Then I should see "Are you sure you wish to delete?"
		And I press "OK"
		And I should see "Charity successfully deleted"

		
