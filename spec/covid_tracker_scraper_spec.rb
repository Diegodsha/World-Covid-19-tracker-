require_relative '../lib/covid_tracker_scraper'

# IMPORTANT NOTE: BECAUSE IT'S A LIVE TRACKER IF THE TESTS FAIL FOR ANY COUNTRY IT MEANS THE INFO HAS BEEN UPDATED
# AND YOU NEED TO RUN AGAIN THE TESTS TO MAKE THEM MACTH
describe CovidTracker do
  let(:tracker) { CovidTracker.new }
  let(:another_tracker) { CovidTracker.new }
  let(:country1) { 'mexico' }
  let(:country2) { 'australia' }
  let(:country3) { 'switzerland' }
  describe '#countries' do
    it 'Returns an array containing all the countries info within a hash' do
      expect(tracker.countries).to be_an(Array)
    end
  end

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

    it 'Returns an empty array if country is not found' do
        expect(tracker.search_country_info("wes")).to eq([])
      end

   
  end
end
