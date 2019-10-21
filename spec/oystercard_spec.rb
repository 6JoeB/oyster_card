require "oystercard"

describe Oystercard do
  let(:oystercard) { Oystercard.new }

  it "creates an isntance of oystercard" do
    expect(oystercard).to be_instance_of(Oystercard)
  end

  it "has a deafult balance of 0" do
    expect(oystercard.balance).to eq(0)
  end

  it "can top up the balance of a card" do
    oystercard.top_up(10.00)
    expect(oystercard.balance).to eq(10.00)
  end
end
