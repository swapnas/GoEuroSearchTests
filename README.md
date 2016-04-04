# GoEuroSearchTests
Cucumber automation tests for the search results page of GoEuro

The automation test cases in this repository are using Cucumber framework. (www.cucumber.io)

To Run the given test case you will need to have the following installed:

• Install cucumber framework (see instructions on cucumber.io)
• Ruby v1.9+
• Watir (Web Application Testing in Ruby),a programmer-friendly inbrowser
test library
• WebDriver, a cross-platform API for controlling web browsers
• Watir WebDriver,a Watir implementation that uses WebDriver under
the hood
• Nokogiri, a Ruby library for parsing HTML results
• (Chrome users) ChromeDriver, a stand-alone program that helps Watir
control Google Chrome


To launch the browser once at the beginning of the test run and shut it down as Cucumber is exiting the following code needs to added to the env.rb file:
require 'watir-webdriver'
require 'nokogiri'
module HasBrowser
@@browser = Watir::Browser.new :chrome
at_exit { @@browser.close }
def browser
@@browser
end

World HasBrowser


The feature files are saved in GoEuroSearchTests/sortingTests/sortByPrice/features

The step defifnitions are stores in GoEuroSearchTests/sortingTests/sortByPrice/features/step_definintions


To run the tests type cucumber at the following destination:
• Search sorting tests by price: GoEuroSearchTests/sortingTests/sortByPrice/
