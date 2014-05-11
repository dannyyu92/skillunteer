	Feature: delete charity from the website

	Background: charities in database
   
	As a user
	So that the list of charities can be edited
	I want to delete a charity from the site

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

	Scenario: navigate to a charity - not going to work
		When I go to the charities page
		And I follow "Animal shelter"
		And I follow "Edit charity"
		Then I should be on the edit page for "Animal shelter"
		And I should see "Delete"

	Scenario: successfully delete charity from data base
		When I go to the edit page for "Animal shelter"
		And I follow "Delete Animal shelter"
		Then I should be on the charities page
		And I should see "Charity successfully deleted"

		
