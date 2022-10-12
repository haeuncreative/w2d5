class Passenger

    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = Array.new
    end

    def has_flight?(string)
        valid_str = make_valid(string)
        if @flight_numbers.include?(valid_str)
            return true
        else
            return false
        end
    end

    def make_valid(string)
        chars = string.split(" ")
        chars.map! do |ele| 
            if ele.is_a?(String)
                ele.upcase
            end
        end
        string = chars.join("")
        return string
    end

    def add_flight(string)
        if !has_flight?(string)
            valid_str = make_valid(string)
            @flight_numbers << valid_str
        end    
    end
end