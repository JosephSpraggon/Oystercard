class Oystercard
    attr_reader :balance, :journey
    MAX_BALANCE = 90
    MIN_FARE = 1
    DEFAULT_BALANCE = 0

    def initialize(balance= DEFAULT_BALANCE)
        @balance = balance
        @journey = false
    end

    def top_up(amount)
        raise "Top up limit reached" if balance + amount > MAX_BALANCE
        @balance += amount
    end

    def deduct(amount)
      @balance -= amount
    end

    def in_journey?
      @journey
    end

    def touch_in
      fail "Insufficent funds" if balance < MIN_FARE
      @journey = true
    end

    def touch_out
      @journey = false
    end

end
