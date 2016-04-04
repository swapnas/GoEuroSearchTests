Feature: Search result sequence for the cheapest fare listing of buses
Scenario: Oneway search results for buses from Berlin to Prague for 1st June 2016 (static date, needs to change
Given User is on the search results page of GoEuro for Berlin to Prague
When When The user clicks on the cheapest search results for buses
Then Then The user should see a sorted list of buses prices in ascending order
