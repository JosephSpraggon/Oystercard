require 'station'

describe Station do
    let(:test_station) { Station.new("Brockley", 2)}


    it 'displays station name' do
        expect(test_station.name).to eq "Brockley"
    end

    it 'displays station zone' do
        expect(test_station.zone).to eq 2
    end

end