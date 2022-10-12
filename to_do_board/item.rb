class Item
    # Item
    # Item::valid_date?(date_string)
    # This method should accept a string and return a boolean indicating 
    # if it is valid date of the form YYYY-MM-DD where Y, M, and D are 
    # numbers, such as 1912-06-23. The month should be a number from 
    # 1 to 12 and the day should be a number from 1 to 31. Here are 
    # examples of the expected behavior:

    def self.valid_date?(date_string)
        parts = date_string.split("-")
        months = (1..12).to_a
        days = (1..31).to_a
        if !months.include?(parts[1].to_i) 
            return false
        elsif !days.include?(parts[2].to_i)
            return false
        end
        return true
    end



    # p Item.valid_date?('2019-10-25') # true
    # p Item.valid_date?('1912-06-23') # true
    # p Item.valid_date?('2018-13-20') # false
    # p Item.valid_date?('2018-12-32') # false
    # p Item.valid_date?('10-25-2019') # false

    # Item#initialize(title, deadline, description)
    # This method should accept a title, deadline, and a description 
    # as arguments. These three pieces of data should be stored as 
    # instance variables of an Item. If the deadline is not a valid 
    # date, raise an error.

    attr_reader :deadline, :done
    attr_accessor :title, :description

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        end
        @description = description
        @done = false
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise error
        end
    end

    def toggle
        if @done == false
            @done = true
        else
            @done = false
        end
    end
end
