	Feature: add charity to the website

	As a charity
	So that volunteers can find my charity
	I want to add my charity to the site

  Background: charities in database
     
      Given the following organizations exist:
      | name            | link              | mission                 | zipcode |
      | Animal shelter  | animals.com       | saving the baby animals | 12345   |
      | Horse petting   | horses.com        | Help the animals        | 12345   |
      | Animal hospital | animalhospital.com| Hospital for animals    | 12345   |
      | Soup Kitchen    | foodforgood.com   | feed the hungry         | 78904   |

	Scenario: view charities
		When I go to the home page
		And I follow "View Charities"
		Then I should be on the charities page

	Scenario: navigate to the add page
		When I go to the charities page
		And I follow "Add one"
		Then I should be on the new page
		And I should see "Add a Charity"

	Scenario: successfully add charity to data base
		When I go to the new page
		And I fill in "Name of charity" with "Volunteer Friends"
		And I fill in "URL" with "volunteerfriends.com"
		And I fill in "Mission Statement" with "friends who volunteer"
		And I fill in "Zipcode" with "13902"
		And I press "Submit"

		When I go to the "new" page
		And I fill in "name" with "Volunteer Friends"
		And I fill in "link" with "volunteerfriends.com"
		And I fill in "mission" with "friends who volunteer"
		And I fill in "zip code" with "13902"
		And I press "submit"
		Then I should see "Charity successfully added"
		And I should see "Volunteer Friends"

		
