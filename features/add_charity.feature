	Feature: add charity to the website

	As a charity
	So that volunteers can find my charity
	I want to add my charity to the site

	Scenario: view charities
		When I go to the home page
		And I press "View Charities"
		Then I should be on the "charities" page

	Scenario: navigate to the add page
		When I go to the "charities" page
		And I press "Add One"
		Then I should be on the "new" page
		And I should see "Add a charity"

	Scenario: successfully add charity to data base
		When I go to the "new" page
		And I fill in "name" with "Volunteer Friends"
		And I fill in "link" with "volunteerfriends.com"
		And I fill in "mission" with "friends who volunteer"
		And I fill in "zip code" with "13902"
		And I press "submit"
		Then I should see "Charity successfully added"
		And I should see "Volunteer Friends"

		
