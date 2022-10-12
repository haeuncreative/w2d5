require_relative 'list.rb'
class ToDoBoard

    def initialize
        @lists = Hash.new
    end

    # def list
    #     @list
    # end

    def run
        system('clear')
        until self.get_command == false
            self.get_command
        end
    end

    def get_command
            puts 'Enter a command, please: '
            cmd, *args = gets.chomp.split(' ')

            case cmd
                when 'mklist'
                    system('clear')
                    @lists[*args] = List.new(*args)
                    self.print_lists
                when 'ls'
                    system('clear')
                    self.print_lists
                when 'showall'
                    system('clear')
                    @lists.values.each do |list|
                        list.print
                    end
                when 'mktodo'
                    @lists[*args[0]].add_item(*args[1..-1])
                    system('clear')
                    @lists[*args[0]].print
                when 'up'
                    @lists[*args[0]].up(*args[1..-1])
                    system('clear')
                    @lists[*args[0]].print

                when 'down'
                    @lists[*args[0]].down(*args[1..-1])
                    system('clear')
                    @list[*args[0]].print
                when 'swap'
                    @lists[*args[0]].swap(*args[1..-1])
                    system('clear')
                    @lists[*args[0]].print
                when 'sort'
                    @lists[*args[0]].sort_by_date
                    system('clear')
                    @lists[*args[0]].print
                when 'toggle'
                    @lists[*args[0]].toggle_item(*args[1..-1])
                    system('clear')
                    @lists[*args[0]].print
                when 'purge'
                    @lists[*args].purge
                    system('clear')
                    @lists[*args].print
                when 'priority'
                    system('clear')
                    @lists[*args].print_priority
                when 'print'
                    if args[1..-1].empty?
                        system('clear')
                        @lists[*args[0]].print
                    else
                        system('clear')
                        @lists[*args[0]].print_full_item(*args[1..-1])
                    end
                when 'rm'
                    @lists[*args[0]].remove_item(*args[1..-1])
                    system('clear')
                    @lists[*args[0]].print
                when 'quit'
                    return false

            end
        true
    end


    def print_lists
        puts '-------------------'
        puts "//LISTS"
        puts '-------------------'
        @lists.keys.each do |list|
            puts "~ #{list}"
        end
        puts '-------------------'

    end
end

p = ToDoBoard.new
p.run