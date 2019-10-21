require "oystercard"

describe Oystercard do
  let(:oystercard) { Oystercard.new }

  it "creates an isntance of oystercard" do
    expect(oystercard).to be_instance_of(Oystercard)
  end

  it "has a deafult balance of 0" do
    expect(oystercard.balance).to eq(0)
  end
end
