Feature: Search result sequence for the cheapest fare listing of trains
Scenario: Oneway search results for trains from Berlin to Prague for 1st June 2016 (static date, needs to change)
Given I am on the search results page of GoEuro for Berlin to Prague
When I click on the cheapest search results for trains
Then I should see a sorted list of train prices in ascending order
