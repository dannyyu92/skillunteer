	Feature: delete charity from the website

	As a user
	So that the list of charities can be edited
	I want to delete a charity from the site

	Scenario: view charities
		When I go to the home page
		And I follow "View Charities"
		Then I should be on the charities page

	Scenario: navigate to a charity - not going to work
		When I go to the charities page
		And I follow "edit"
		Then I should be on the edit page for Animal shelter
		And I should see "Delete"

	Scenario: successfully delete charity from data base
		When I go to the edit page for Animal shelter
		And I press "delete"
		Then I should see "Are you sure you wish to delete?"
		And I press "OK"
		And I should see "Charity successfully deleted"

		
