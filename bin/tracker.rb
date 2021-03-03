require_relative '../lib/covid_tracker_scraper'

info = CovidTracker.new

puts "Welcome to Covid-19 live tracker.\nPlease type the name of the country you want to research."
search_your_country = gets.strip.downcase

 search_result = info.search_country_info(search_your_country) 

 puts "\nThese are Covid-19 live records for #{search_result[0][:name]} at #{Time.now.ctime}:
 \nTotal cases: #{search_result[0][:total_cases]} 
 \nNew cases: #{search_result[0][:new_cases]}
 \nTotal deaths: #{search_result[0][:total_deaths]}
 \nNew deaths: #{search_result[0][:new_deaths]}
 \nTotal recovered: #{search_result[0][:total_recovered]}
 \nActive cases: #{search_result[0][:active_cases]}
 \nPopulation: #{search_result[0][:population]}"