class Oystercard
    attr_reader :balance, :entry_station
    MAX_BALANCE = 
    MIN_FARE = 1
    DEFAULT_BALANCE = 0

    def initialize(balance= DEFAULT_BALANCE)
        @balance = balance
        @entry_station = nil
    end

    def top_up(amount)
        raise "Top up limit reached" if balance + amount > MAX_BALANCE
        @balance += amount
    end

    def in_journey?
      !(@entry_station == nil)
    end

    def touch_in(station)
      fail "Insufficent funds" if balance < MIN_FARE
      @entry_station = station
    end

    def touch_out
      deduct(MIN_FARE)  
      @entry_station = nil
    end

    private
    def deduct(amount)
        @balance -= amount
    end

end
