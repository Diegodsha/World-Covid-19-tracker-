require_relative '../lib/covid_tracker_scraper'

# IMPORTANT NOTE: BECAUSE IT'S A LIVE TRACKER IF THE TESTS FAIL FOR ANY COUNTRY IT MEANS THE INFO HAS BEEN UPDATED
# AND YOU NEED TO RUN AGAIN THE TESTS TO MAKE THEM MACTH
describe CovidTracker do
  let(:tracker) { CovidTracker.new }
  let(:another_tracker) { CovidTracker.new }
  let(:country1) { 'mexico' }
  let(:country2) { 'australia' }
  let(:country3) { 'switzerland' }

  describe '#search_country_info' do
    it 'Returns an array containing a hash with an specific country info' do
      expect(tracker.search_country_info(country1)).to eq(another_tracker.search_country_info(country1))
    end

    it 'Returns an array containing a hash with an specific country info' do
      expect(tracker.search_country_info(country2)).to eq(another_tracker.search_country_info(country2))
    end

    it 'Returns an array containing a hash with an specific country info' do
      expect(tracker.search_country_info(country3)).to eq(another_tracker.search_country_info(country3))
    end

    it 'Returns an empty array if country is not found or does not exist' do
      expect(tracker.search_country_info('Vice-city')).to eq([])
    end

    it 'Returns an empty array if country is misspelled' do
      expect(tracker.search_country_info('mexicoo')).to eq([])
    end

    it 'Returns an empty array if user inputs an unexcpeted value' do
      expect(tracker.search_country_info('76-Donut-$')).to eq([])
    end
  end
end
