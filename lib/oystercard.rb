class Oystercard
    attr_reader :balance, :entry_station, :last_journey, :journey_history
    MAX_BALANCE = 90
    MIN_FARE = 1
    DEFAULT_BALANCE = 0

    def initialize(balance= DEFAULT_BALANCE)
        @balance = balance
        @entry_station = nil
        @journey_history = []
    end

    def top_up(amount)
        raise "Top up limit reached" if balance + amount > MAX_BALANCE
        @balance += amount
    end

    def in_journey?
      !(@entry_station == nil)
    end

    def touch_in(entry_station)
      fail "Insufficent funds" if balance < MIN_FARE
      @entry_station = entry_station
    end

    def touch_out(exit_station)
      deduct(MIN_FARE)
      @exit_station = exit_station
      add_journey
      @entry_station = nil
    end

    def last_journey
      @journey_history.last
    end

    private
    def deduct(amount)
        @balance -= amount
    end

    def add_journey
      @journey_history << { entry_station: @entry_station, exit_station: @exit_station}
    end

end
