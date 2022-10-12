require_relative 'item.rb'

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = Array.new
    end

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index < 0 || index >= self.size
            return false
        end
        return true
    end

    def swap(index_1, index_2)
        index_1 = num_convert(index_1)
        index_2 = num_convert(index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
            return false
        end
    end

    def [](index)
        index = num_convert(index)
        if valid_index?(index)
            @items[index]
        else
            return nil
        end
    end

    def priority
        @items[0]
    end

    def print
        puts '------------------------------------------------'
        puts "#{@label}".rjust(22)
        puts '------------------------------------------------'
        puts 'Index | ' + 'Item'.ljust(17) + ' |  Deadline  | Done?'
        puts '------------------------------------------------'
        (0...self.size).each do |i|
            if @items[i].done == false
                puts "#{i}".ljust(6) + "| #{@items[i].title}".ljust(19) + " | #{@items[i].deadline} | [ ]"
            else
                puts "#{i}".ljust(6) + "| #{@items[i].title}".ljust(19) + " | #{@items[i].deadline} | [x]"
            end

        end
        puts '------------------------------------------------'
    end

    def print_init
        puts '------------------------------------------------'
        puts "#{@label}".rjust(22)
        puts '------------------------------------------------'
        puts 'Index | ' + 'Item'.ljust(17) + ' |  Deadline  | Done?'
        puts '------------------------------------------------'
        puts ''
        puts '------------------------------------------------'
    end


    def print_full_item(i)
        i = num_convert(i)
        if valid_index?(i)
            puts '-------------------------------------------'
            if @items[i].done == false
                puts "#{@items[i].title}".ljust(21) + "#{@items[i].deadline} | " + "Done? [ ]" 
            else
                puts "#{@items[i].title}".ljust(21) + "#{@items[i].deadline} | " + "Done? [x]" 
            end
            puts ""
            puts ""
            puts "#{@items[i].description}"
            puts '-------------------------------------------'
        else
            raise 'not valid index'
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(i, amt=1)
        i = num_convert(i)
        amt = num_convert(amt)
        if valid_index?(i)
            n = i
            j = 0
            until j == amt || i == 0
                swap(i, i - 1)
                j += 1
                i -= 1
            end
            return true
        else
            return false
        end
    end

    def down(i, amt=1)
        i = num_convert(i)
        amt = num_convert(amt)
        if valid_index?(i)
            n = i
            j = 0
            until j == amt || i == (self.size - 1)
                swap(i, i + 1)
                j += 1
                i += 1
            end
            return true
        else
            return false
        end
    end

    def sort_by_date
        @items.sort_by! {|item| item.deadline}
    end

    def num_convert(i)
        if i.instance_of?(String)
            i = i.to_i
            return i 
        elsif i.instance_of?(Integer)
            i
        end
    end

    def toggle_item(index)
        index = num_convert(index)
        if valid_index?(index)
            @items[index].toggle
        end
    end

    def remove_item(i)
        i = num_convert(i)
        @items.delete_at(i)
        @items.compact!
    end

    def purge
        while @items.any? {|item| item.done == true}
            @items.each_with_index do |item, i|
                if item.done == true
                    remove_item(i)
                end
            end
        end
    end
end