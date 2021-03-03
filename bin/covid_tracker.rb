require 'httparty'
require 'nokogiri'
require 'byebug'


# def all_countries
#     unparsed_page = HTTParty.get('https://www.worldometers.info/coronavirus/')
#     parsed_page = Nokogiri::HTML(unparsed_page)
  
#     records = []
#     total_countries = parsed_page.css('table.table_countries_today > tbody > tr')
#                                       .map(&:text).count
#     i = 8
#     while i < 229
#       record = parsed_page.css("table#main_table_countries_today > tbody > 
#                                 tr[#{i}]").text
#       record = record.split("\n")
#       record_hash = { "name": record[2], "total_cases": record[3], 
#                       "new_cases": record[4], 
#                       "total_deaths": record[5], 
#                       "new_deaths": record[6],
#                       "total_recovered": record[7], 
#                       "active_cases": record[8], 
#                       "first_case": record[9] }
#       records << record_hash
#       i += 1
#     end
#    records
#    byebug
#   end
# all_countries




#class CovidTracker
def covid_tracker
#def initialize
    url = "https://www.worldometers.info/coronavirus/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    
    #all_countries = parsed_page.css('table#main_table_countries_today > tbody > tr').count

    country_info = []

    i = 8
    while i < 229

        country_record = parsed_page.css("table#main_table_countries_today > tbody > tr[#{i}]").text

        country_record = country_record.split("\n")
        country_record_hash = {
            name: country_record[2], total_cases: country_record[3],
            new_cases: country_record[4], total_deaths: country_record[5],
            new_deaths: country_record[6], total_recovered: country_record[7],
            active_cases: country_record[8], population: country_record[15]
        }

        country_info << country_record_hash
        i += 1
    end
    country_info
    byebug
end
covid_tracker
#end
