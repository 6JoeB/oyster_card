class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90.00

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Top up maximum limit is £90.00" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end
end
