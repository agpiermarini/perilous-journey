require "./lib/node"

class LinkedList

attr_reader :head,
            :count

    def initialize
        @head = nil
        @count = 0
    end

    def append(surname)
        @count += 1
        @head = Node.new(surname)
    end

    def to_string
        p "The #{@head.surname} family"
    end

end
