require 'httparty'
require 'nokogiri'

class CovidTracker
  def countries
    url = 'https://www.worldometers.info/coronavirus/'
    unparsed_page = HTTParty.get(url)
    parsed_page ||= Nokogiri::HTML(unparsed_page.body)

    all_countries = parsed_page.css('table#main_table_countries_today > tbody > tr').count

    country_info = []

    i = 8
    while i < all_countries - 8

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
  end

  def search_country_info(country_name)
    country_name.downcase
    countries.select { |country| country[:name].downcase == country_name }
  end
end
