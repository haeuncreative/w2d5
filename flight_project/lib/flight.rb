class Flight

    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = Array.new
    end

    def full?
        if @passengers.length == @capacity
            return true
        else
            return false
        end
    end

    def board_passenger(passenger)
        if !self.full? && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end

    def list_passengers
        list = Array.new
        @passengers.each {|pass| list << pass.name}
        list
    end

    def [](i)
        @passengers[i]
    end

    def << (passenger)
        board_passenger(passenger)
    end

end