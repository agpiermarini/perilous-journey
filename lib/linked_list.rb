
require "./lib/node"
class LinkedList

attr_accessor   :head,
                :tail,
                :count

    def initialize
        @head = nil
        @tail = nil
        @count = 0
    end

    def append(surname)
        @count += 1

        new_node = Node.new(surname)

        if @head == nil
            @head = new_node
            @tail = @head
        elsif head.next_node == nil
            head.next_node = new_node
            @tail = new_node
        else
            tail.next_node = new_node
            @tail = new_node
            #how do we scan through nodes?
        end
    end

    def to_string
        "The #{head.surname} family"
    end

end
