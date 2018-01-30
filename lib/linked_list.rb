require "./lib/node"

class LinkedList

attr_reader :head

    def initialize
        @head = nil
        @count = 0
    end

    def append(surname)
        @count += 1
        @head = Node.new(surname)
    end

    def count
        @count
    end

end
