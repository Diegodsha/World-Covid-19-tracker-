require 'httparty'
require 'nokogiri'
require 'byebug'


#class CovidTracker
def countries
#def initialize
    url = "https://www.worldometers.info/coronavirus/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    
    all_countries = parsed_page.css('table#main_table_countries_today > tbody > tr').count
    



end

#countries

#end
