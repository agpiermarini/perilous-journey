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

    # def test_it_has_tail_nil_by_default
    #     list = LinkedList.new
    #     assert_nil list.tail
    # end

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
        list.append("West")
        assert_equal 1, list.count
    end

    def test_generates_string_with_family_names
        list = LinkedList.new
        list.append("West")
        assert_equal "The West family", list.to_string
    end

##Iteration 2
    def test_can_append_multiple_nodes
        list = LinkedList.new

        assert_instance_of Node, list.append("Rhodes") #do i need assert_instance_of
        assert_equal "Rhodes", list.head.surname
        assert_nil list.head.next_node
        assert_equal "Rhodes", list.tail.surname

        assert_instance_of Node, list.append("Hardy")
        assert_equal "Rhodes", list.head.surname
        assert_equal "Hardy", list.head.next_node.surname
        assert_equal "Hardy", list.tail.surname
        list.head.next_node.next_node

        assert_instance_of Node, list.append("Smith")
        # binding.pry
        assert_equal "Rhodes", list.head.surname
        assert_equal "Hardy", list.head.next_node.surname
        assert_equal "Smith", list.head.next_node.next_node.surname
        assert_equal "Smith", list.tail.surname
    end

end
