require "station"

describe Station do
  # let(:station) { Station.new("Waterloo", "Zone 2") }
  subject { described_class.new(name: "Waterloo", zone: 2) }

  it "provides the name of the station" do
    expect(subject.name).to eq "Waterloo"
  end

  it "provides the zone of the station" do
    expect(subject.zone).to eq 2
  end
end
