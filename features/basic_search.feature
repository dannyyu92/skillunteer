	

    Feature: search for volunteer opportunity
     
      As a community member
      So that I can help people
      I want to find a volunteer opportunity
     
    Background: organizations in database
     
      Given the following organizations exist:
		####change this
      | title        | rating | director     | release_date |
      | Star Wars    | PG     | George Lucas |   1977-05-25 |
      | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
      | Alien        | R      |              |   1979-05-25 |
      | THX-1138     | R      | George Lucas |   1971-03-11 |
     
    Scenario: search returns exactly 3 results
      When I go to the home page
      And  I fill in "Search" with "Computers"
      And  I press "Go"
			Then I should be on the results page
      Then I should see "Org title here"
			And I should see "Org title here"
			And I should see "org title here"
     
    Scenario: search returns less than 3 results
      When I go to the home page
      And  I fill in "Search" with "Keyword"
      And  I press "Go"
			Then I should be on the results page
      Then I should see "Org title here"
			And I should see "message about few results"
     
    Scenario: search returns zero results
      When I go to the home page
      And  I fill in "Search" with "Keyword"
      And  I press "Go"
			Then I should be on the results page
      Then I should see "error message"
