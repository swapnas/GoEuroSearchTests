Feature: Search result sequence for the cheapest fare listing of flights
Scenario: Oneway search results for flights from Berlin to Prague for 1st June 2016 (static date, needs to change)
Given The user is on the search results page of GoEuro for Berlin to Prague
When  click on the cheapest search results for flights
Then You should see a sorted list of flights prices in ascending order