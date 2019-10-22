require "oystercard"

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:station){ double :station }

  it "creates an instance of oystercard" do
    expect(oystercard).to be_instance_of(Oystercard)
  end

  it "has a default balance of 0" do
    expect(oystercard.balance).to eq(0)
  end

  it "can top up the balance of a card" do
    oystercard.top_up(10.00)
    expect(oystercard.balance).to eq(10.00)
  end

  it "has a maximum balance of 90" do
    expect{oystercard.top_up(100.00)}.to raise_error "Top up maximum limit is £90.00"
  end

  it "can tell if you are in a journey or not" do
    expect(oystercard.in_journey?).to eq(true).or eq(false)
  end

  it "can track when you touch in and go on a journey" do
    oystercard.top_up(10.00)
    oystercard.touch_in(station)
    expect(oystercard.in_journey?).to be true
  end

  it "can track when you touch out and are no longer on a journey" do
    oystercard.top_up(10.00)
    oystercard.touch_out(station)
    expect(oystercard.in_journey?).to be false
  end

  it "throws an error if the card doesn't have enough funds for a journey" do
    expect{oystercard.touch_out(station)}.to raise_error("Insufficient funds for journey")
  end

  it "deducts funds when user touches out" do
    oystercard.top_up(10.00)
    expect{oystercard.touch_out(station)}.to change{oystercard.balance}.by(-Oystercard::MINIMUM_CHARGE)
  end

  it "starts with an empty journey history" do
    expect(oystercard.location_history).to be_empty
  end

  it "takes a parameter of start location when touching in" do
    oystercard.top_up(10.00)
    oystercard.touch_in(station)
    expect(oystercard.location_history).to include(station)
  end

  it "takes a station as an argument and adds it to the location history" do
    oystercard.top_up(10.00)
    oystercard.touch_out(1.00, station)
    expect(oystercard.location_history).to include(station)
  end
  
end
