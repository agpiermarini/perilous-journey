require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/linked_list"

class LinkedListTest < Minitest::Test

    def test_it_can_be_created
        list = LinkedList.new
        assert_equal LinkedList, list.class
    end

    def test_it_has_head_nil_by_default
        list = LinkedList.new
        assert_nil list.head
    end

    def test_it_has_tail_nil_by_default
        list = LinkedList.new
        assert_nil list.tail
    end

    def test_can_append_node
        list = LinkedList.new
        assert_instance_of Node, list.append("West")
    end

    def test_first_append_updates_head
        list = LinkedList.new
        list.append("West")
        assert_equal "West", list.head.surname
    end

    def test_appended_node_points_to_nil
        list = LinkedList.new
        list.append("West")
        assert_nil list.head.next_node
    end

    def test_nodes_can_be_counted
        list = LinkedList.new
        assert_equal 0, list.count
        list.append("West")
        assert_equal 1, list.count
        list.append("Adams")
        assert_equal 2, list.count
        list.append("Hardy")
        assert_equal 3, list.count
        list.append("Smith")
        assert_equal 4, list.count
        assert_equal 4, list.count
    end

    # def test_generates_string_with_family_names
    #     list = LinkedList.new
    #     list.append("West")
    #     assert_equal "The West family", list.to_string
    # end

##Iteration 2
    def test_can_append_multiple_nodes
        list = LinkedList.new

        assert_instance_of Node, list.append("West") #do i need assert_instance_of
        assert_equal "West", list.head.surname
        assert_nil list.head.next_node

        assert_instance_of Node, list.append("Adams")
        assert_equal "West", list.head.surname
        assert_equal "Adams", list.head.next_node.surname
        assert_equal "Adams", list.tail.surname

        assert_instance_of Node, list.append("Smith")
        assert_equal "West", list.head.surname
        assert_equal "Adams", list.head.next_node.surname
        assert_equal "Smith", list.head.next_node.next_node.surname
        assert_equal "Smith", list.tail.surname

        assert_instance_of Node, list.append("Hardy")
        assert_equal "West", list.head.surname
        assert_equal "Adams", list.head.next_node.surname
        assert_equal "Smith", list.head.next_node.next_node.surname
        assert_equal "Hardy", list.head.next_node.next_node.next_node.surname
        assert_equal "Hardy", list.tail.surname
    end

    def test_generates_string_with_multiple_family_names
        list = LinkedList.new
        list.append("West")
        list.append("Adams")
        list.append("Smith")
        list.append("Hardy")
        assert_equal ("The West family, followed by the Adams family, followed by the Smith family, followed by the Hardy family"), list.to_string
    end

#Iteration 3
    def test_can_prepend_nodes
        list = LinkedList.new
        list.append("West")
        list.append("Adams")

        list.prepend("Smith")
        assert_equal "Smith", list.head.surname
        assert_equal "West", list.head.next_node.surname
        assert_equal "Adams", list.head.next_node.next_node.surname
        assert_equal "Adams", list.tail.surname
        assert_equal 3, list.count
    end

    def test_can_prepend_nodes_when_list_empty
        list = LinkedList.new

        list.prepend("West")
        assert_equal "West", list.head.surname
        assert_equal "West", list.tail.surname
        assert_equal 1, list.count
    end

    def test_can_insert_nodes_in_index
        list = LinkedList.new
        list.append("West")
        list.append("Adams")
        list.append("Smith")

        list.insert(1, "Hardy")
        assert_equal "West", list.head.surname
        assert_equal "Hardy", list.head.next_node.surname
        assert_equal "Adams", list.head.next_node.next_node.surname
        assert_equal "Smith", list.head.next_node.next_node.next_node.surname
        assert_equal "Smith", list.tail.surname
        assert_equal 4, list.count
    end

    def test_can_insert_nodes_below_index
        list = LinkedList.new
        list.append("West")
        list.append("Adams")
        list.append("Smith")

        list.insert(-2, "Rhodes")
        assert_equal "Rhodes", list.head.surname
        assert_equal "West", list.head.next_node.surname
        assert_equal "Adams", list.head.next_node.next_node.surname
        assert_equal "Smith", list.head.next_node.next_node.next_node.surname
        assert_equal "Smith", list.tail.surname
        assert_equal 4, list.count
    end

    def test_can_insert_nodes_above_index
        #skip
        list = LinkedList.new
        list.append("West")
        list.append("Adams")
        list.append("Smith")

        list.insert(5, "Davies")
        assert_equal "West", list.head.surname
        assert_equal "Adams", list.head.next_node.surname
        assert_equal "Smith", list.head.next_node.next_node.surname
        assert_equal "Davies", list.head.next_node.next_node.next_node.surname
        assert_equal "Davies", list.tail.surname
        assert_equal 4, list.count
    end

end
