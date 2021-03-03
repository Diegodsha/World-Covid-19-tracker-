require_relative '../lib/covid_tracker_scraper'

describe CovidTracker do
    let(:tracker) { CovidTracker.new }
    let(:another_tracker) { CovidTracker.new  } 
    describe "#countries" do
        it "Returns an array containing all the countries info within a hash" do
            expect(tracker.countries).to  be_an(Array)
            
        end
    end

    describe "#search_country_info" do
        it "Returns an array containing a hash with an specific country info" do
            expect(tracker.search_country_info("mexico")).to eq(another_tracker.search_country_info("mexico")
            ) 
        end
    end
    
    
end
