require 'httparty'
require 'nokogiri'
require 'byebug'

#class CovidTracker
def covid_tracker
#def initialize
    url = "https://www.worldometers.info/coronavirus/"
    unparsed_page = HTTParty.get(url)
    parsed_page ||= Nokogiri::HTML(unparsed_page.body)
    
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
    #byebug
end
#covid_tracker


def search_country_info(country_name)
country_name.downcase

covid_tracker.select do|country| 
    country[:name].downcase == country_name 
    
end

#byebug
end

puts "Welcome to Covid-19 live tracker.\nPlease type the name of the country you want to research."
search_your_country = gets.strip.downcase

 search_result = search_country_info(search_your_country) 

 puts "\nThese are Covid-19 live records for #{search_result[0][:name]} at #{Time.now.ctime}:
 \nTotal cases: #{search_result[0][:total_cases]} 
 \nNew cases: #{search_result[0][:new_cases]}
 \nTotal deaths: #{search_result[0][:total_deaths]}
 \nNew deaths: #{search_result[0][:new_deaths]}
 \nTotal recovered: #{search_result[0][:total_recovered]}
 \nActive cases: #{search_result[0][:active_cases]}
 \nPopulation: #{search_result[0][:population]}"

#end
