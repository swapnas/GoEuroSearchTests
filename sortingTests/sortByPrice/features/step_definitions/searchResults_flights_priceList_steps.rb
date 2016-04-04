CheapestFareButton = '//div[@id="sortby-price"]'
FlightSearchResultsButton = '//a[contains(@class,"ico-flight-2")]'

#Searching oneway route with  a static date, can be extended to roundtrip and dynamic date searches  
SearchPage = "http://www.goeuro.com/search/MTUxMTI5NTE2OkNLeWJpRWdTRWdsOFJSejkydE55cFJGZGJFekgtb2JmZ0JvTUNJRE45LWk5S2hJRFZWUkRJZ2NJNEE4UUJoZ0JNSm43Rmppei1CWkNHQWdqRWhRS0RHUmxkWFJ6WTJobFFtRm9iaElFYm05dVpWQUFVQUZRQWxBRFdpZ0tHakp1YW1rMlptc3phRGxtYjI4eVpXRjBPR3hxYXpRMmJYVTFFSllCR2dOamIyMGlBbVZ1"

Given /^The user is on the search results page of GoEuro for Berlin to Prague$/ do
        browser.goto SearchPage
end

When /^click on the cheapest search results for flights$/ do
        browser.a(:xpath => FlightSearchResultsButton).click
        browser.div(:xpath => CheapestFareButton).click
end

Then /^You should see a sorted list of flights prices in ascending order$/ do
        doc = Nokogiri::HTML browser.html
        #Wait for javascript to load
        browser.div(:id,"results-flight").when_present{
                currencyList = doc.css('div#results-flight div.custom div.result span.currency-beforecomma').map &:text
                decimalList = doc.css('div#results-flight div.custom div.result span.currency-decimals').select{|e| e.text=~ /\d/}.map &:text
                priceList = currencyList.map.with_index{ |m,i| m.to_f + ((decimalList[i].to_f)/100) }
                priceListSorted = priceList.sort
                #Should use assertions here (but struggling with Ruby at the moment!)
                if priceList == priceListSorted
                        puts "flight search results sequence correct for cheapest fares"
                else
                        puts "cheapest flight results sequence incorrect, test failed"
                        throw Exception
                end
                priceList.each do |d|
                        puts d
                end
                priceListSorted.each do |d|
                        puts d
                end
        }
end