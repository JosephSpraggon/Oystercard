class Oystercard
    attr_reader :balance
    MAX_BALANCE = 90

    def initialize(balance=0)
        @balance = balance
    end

    def top_up(amount)
        raise "Top up limit reached" if balance + amount > MAX_BALANCE
        @balance += amount
    end

    def deduct(amount)
      @balance -= amount
    end

end
