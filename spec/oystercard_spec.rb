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

  it "has a maximum balance of 90" do
    expect{oystercard.top_up(100.00)}.to raise_error "Top up maximum limit is £90.00"
  end

  it "can deduct money when a ticket is bought" do
    oystercard.top_up(10.00)
    oystercard.deduct(3.40)
    expect(oystercard.balance).to eq(6.60)
  end
end
