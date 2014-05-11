  Feature: search for volunteer opportunity
   
		Background: charities in database
     
		As a community member
    So that I can help people
    I want to find a volunteer opportunity

      Given the following organizations exist:
      | name            | link              | mission                 | zipcode |
      | Animal shelter  | animals.com       | saving the baby animals | 12345   |
      | Horse petting   | horses.com        | Help the animals        | 12345   |
      | Animal hospital | animalhospital.com| Hospital for animals    | 12345   |
      | Soup Kitchen    | foodforgood.com   | feed the hungry         | 78904   |
   
  Scenario: search returns exactly 3 results
    When I go to the home page
    And  I fill in "category" with "Animals"
    And  I press "Go"
		Then I should be on the results page
    Then I should see "Animal shelter"
		And I should see "Horse petting"
		And I should see "Animal hospital"
	
	Scenario: search returns less than 3 results
		When I go to the home page
		And I fill in "category" with "hungry"
		And I press "Go"
		Then I should be on the results page
		Then I should see "Soup Kitchen"
		And I should see "message about there being less charities"
