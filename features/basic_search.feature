  Feature: search for volunteer opportunity
   
    As a community member
    So that I can help people
    I want to find a volunteer opportunity
   
  Scenario: search returns exactly 3 results
    When I go to the home page
    And  I fill in "Search" with "Computers"
    And  I press "Go"
		Then I should be on the results page
    Then I should see "Org title here"
		And I should see "Org title here"
		And I should see "Org title here"
