class Passenger

    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = Array.new
    end

    def has_flight?(string)
        if self.flight_numbers.include?(string)
            return true
        end
        return false
    end
















end