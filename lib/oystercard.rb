class Oystercard
  attr_reader :balance, :location_history, :single_journey
  MAXIMUM_BALANCE = 90.00
  MINIMUM_FUNDS = 1.00
  MINIMUM_CHARGE = 1.00

  def initialize
    @balance = 0
    @active_journey = false
    @location_history = []
    @single_journey = {}
  end

  def top_up(amount)
    fail "Top up maximum limit is £90.00" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @active_journey
  end

  def touch_in(station)
    @single_journey.clear
    @single_journey.merge!(entry_station: station)
    @location_history << station
    @active_journey = true
  end

  def touch_out(amount = MINIMUM_CHARGE, station)
    fail "Insufficient funds for journey" if @balance < MINIMUM_FUNDS
    deduct(amount)
    @active_journey = false
    @single_journey.merge!(exit_station: station)
    @location_history << station
  end

 private

  def deduct(amount)
    fail "Insufficient funds in balance" if @balance - amount < 0
    @balance -= amount
  end

end
