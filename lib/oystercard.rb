class Oystercard
    attr_reader :balance, :journey
    MAX_BALANCE = 90

    def initialize(balance=0)
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
        @journey = true
    end

    def touch_out
        @journey = false
    end

end
