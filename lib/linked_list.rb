
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

    def count
        head.nil? ? @count = 0 : (                  #is this acceptable, discouraged? because of alignment/style or use of ternary, etc?

        @count = 1
        current_node = head
        until current_node.next_node.nil?
            @count += 1
            current_node = current_node.next_node
        end

        @count
        )
    end

    def append(surname)
        new_node = Node.new(surname)

        @head.nil? ? (@head = new_node; @tail = @head) :                #what about this?
                     (@tail.next_node = new_node; @tail = new_node)
    end

    def prepend(surname)
        new_node = Node.new(surname)

        if @head.nil?
            @head = new_node
            @tail = @head
        else
            previous_head = @head
            @head = new_node
            @head.next_node = previous_head
        end
    end

    def insert(position, surname)
        if @head.nil? || position <= 0
            prepend(surname)
        elsif position >= count                 #why doesnt this pass when @count?
            append(surname)
        else
            offset = position - 1
            preceeding_node = head
            proceeding_node = head.next_node

            offset.times do
                preceeding_node = preceeding_node.next_node
                proceeding_node = proceeding_node.next_node
            end
            preceeding_node.next_node = Node.new(surname)
            preceeding_node.next_node.next_node = proceeding_node
        end
    end

    def to_string
        head.nil? ? (family_names = "No families have been added to the wagon train"):
                    (family_names = "The #{head.surname} family"; current_node = head.next_node)

        until current_node.nil?
            family_names += ", followed by the #{current_node.surname} family"
            current_node = current_node.next_node
        end

        return family_names
    end

end




##DELETE BEFORE FINAL COMMIT
# def count
#
#     if head.nil?
#         @count = 0
#     else
#         current_node = head
#         @count = 1
#         until current_node.next_node.nil?
#             @count += 1
#             current_node = current_node.next_node
#         end
#         @count
#     end
# end

# def count
#     head.nil? ? @count = 0 : @count = 1
#
#     current_node = head
#     until current_node.next_node.nil?
#         @count += 1
#         current_node = current_node.next_node
#     end
#
#     @count
# end

# def append
#   if @head == nil                      #clean up redundancies---only two conditions if/else, either head is nil or not
#       @head = new_node
#       @tail = @head
#   elsif head.next_node == nil
#       head.next_node = new_node
#       @tail = new_node
#   else
#       tail.next_node = new_node
#       @tail = new_node
#   end
# end

#def append
#     if @head == nil                     #clean up redundancies---only two conditions if/else, either head is nil or not
#         @head = new_node
#         @tail = @head
#     else
#         @tail.next_node = new_node
#         @tail = new_node
#     end
# end

# def to_string
#
#     family_names = "The #{head.surname} family"
#
#     current_node = head.next_node
#
#     until current_node.nil?
#         family_names += ", followed by the #{current_node.surname} family"
#         current_node = current_node.next_node
#     end
#
#     return family_names
#
# end
