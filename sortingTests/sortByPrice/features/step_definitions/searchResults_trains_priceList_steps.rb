CheapestFareButton = '//div[@id="sortby-price"]'
TrainSearchResultsButton = '//a[@class="ico-train-2"]'

Given /^I am on the search results page of GoEuro for Berlin to Prague$/ do
	#Searching oneway route with  a static date, can be extended to roundtrip and dynamic date searches  
	browser.goto 'http://www.goeuro.com/search/MTUxMTI5NTE2OkNLeWJpRWdTRWdsOFJSejkydE55cFJGZGJFekgtb2JmZ0JvTUNJRE45LWk5S2hJRFZWUkRJZ2NJNEE4UUJoZ0JNSm43Rmppei1CWkNHQWdqRWhRS0RHUmxkWFJ6WTJobFFtRm9iaElFYm05dVpWQUFVQUZRQWxBRFdpZ0tHakp1YW1rMlptc3phRGxtYjI4eVpXRjBPR3hxYXpRMmJYVTFFSllCR2dOamIyMGlBbVZ1'
end

When /^I click on the cheapest search results for trains$/ do
	browser.div(:xpath => TrainSearchResultsButton).click
	browser.div(:xpath => CheapestFareButton).click
end

Then /^I should see a sorted list of train prices in ascending order$/ do
	doc = Nokogiri::HTML browser.html
	browser.div(:id,"results-train").when_present{
		currencyList = doc.css('div#results-train div.custom div.result span.currency-beforecomma').map &:text
		decimalList = doc.css('div#results-train div.custom div.result span.currency-decimals').select{|e| e.text=~ /\d/}.map &:text
		priceList = currencyList.map.with_index{ |m,i| m.to_f + ((decimalList[i].to_f)/100) }
		priceListSorted = priceList.sort
		#priceList.should_not be_empty
		assert priceList == priceListSorted
		priceList.each do |d|
			puts d
		end
		priceListSorted.each do |d|
			puts d
		end
	}
end
