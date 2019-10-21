class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90.00

  def initialize
    @balance = 0
    @active_journey = false
  end

  def top_up(amount)
    fail "Top up maximum limit is £90.00" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    fail "Insufficient funds in balance" if @balance - amount < 0
    @balance -= amount
  end

  def in_journey?
    @active_journey
  end

  def touch_in
    fail "Insufficient funds for journey" if @balance < 1
    @active_journey = true
  end

  def touch_out
    @active_journey = false
  end
end
