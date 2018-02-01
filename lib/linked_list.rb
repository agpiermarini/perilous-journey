
require "./lib/node"
class LinkedList

attr_accessor   :head,
                :count

    def initialize
        @head = nil
        @count = count
    end

    def new_node(surname)
      Node.new(surname.to_s)
    end

    def count
      if @head.nil?
        @count = 0
      else
        current_node = @head
        @count = 1
        until current_node.next_node.nil?
            @count += 1
            current_node = current_node.next_node
        end
        @count
      end
    end

    def append(surname)
      if @head.nil?
        @head = new_node(surname)
      else
        current_node = @head
        until current_node.next_node == nil
          current_node = current_node.next_node
        end
      current_node.next_node = new_node(surname)
      end
    end

    def prepend(surname)
        if @head.nil?
          @head = new_node(surname)
        else
          previous_head = @head
          @head = new_node(surname)
          @head.next_node = previous_head
        end
    end

    def insert(position, surname)
        if @head.nil? || position <= 0
            prepend(surname)
        elsif position >= count
            append(surname)
        else
            offset = position - 1
            index_previous_node = @head
            index_subsequent_node = @head.next_node

            offset.times do
                index_previous_node = index_previous_node.next_node
                index_subsequent_node = index_subsequent_node.next_node
            end
            index_previous_node.next_node = new_node(surname)
            index_previous_node.next_node.next_node = index_subsequent_node
        end
    end

    def to_string(starting_position = @head, ending_position = count)
      return "There are no families in the wagon train" if @head.nil?

      family_names = "The #{starting_position.surname} family"

      current_node = starting_position.next_node

      if ending_position == count || ending_position <= 0 || ending_position > count
        until current_node.nil?
          family_names += ", followed by the #{current_node.surname} family"
          current_node = current_node.next_node
        end
      else
        offset = ending_position - 1
        offset.times do
          family_names += ", followed by the #{current_node.surname} family"
          current_node = current_node.next_node
        end
      end
      family_names
    end

    def find(index, num_elements)
      starting_position = @head

      if index < 0 || index >= count
        to_string(@head, count)
      else
        index.times do
          starting_position = starting_position.next_node
        end
      to_string(starting_position, num_elements)
      end
    end

    def includes?(surname)
      if @head.nil?
        false
      else
        current_node = @head
        until current_node.next_node == nil
          break if current_node.surname == surname.to_s
          current_node = current_node.next_node
        end
        current_node.surname == surname.to_s
      end
    end

    def died_of_dysentery(surname)
      "The #{surname} family has died of dysentery"
    end

    def pop
      if @head.nil?
        "You've killed off all of the families already. You monster."
      elsif count == 1
        dead_family = @head
        died_of_dysentery(dead_family.surname)
        @head = nil
        dead_family
      else
        current_node = @head
          until current_node.next_node.next_node == nil
            current_node = current_node.next_node
          end
        dead_family = current_node.next_node
        current_node.next_node = nil
        died_of_dysentery(dead_family.surname)
        dead_family
      end
    end

end
