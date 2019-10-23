require "station"

describe Station do
  let(:station) { Station.new("Waterloo", "Zone 2") }

  it "provides the name of the station" do
    expect(station.name).to eq "Waterloo"
  end

  it "provides the zone of the station" do
    expect(station.zone).to eq "Zone 2"
  end
end
