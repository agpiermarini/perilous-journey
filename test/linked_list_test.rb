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

    def test_node_can_be_added
        list = LinkedList.new
        assert_instance_of Node, list.append("West")
    end

    def test_first_node_updates_head
        list = LinkedList.new
        list.append("West")
        assert_equal "West", list.head.surname
    end

    def test_first_node_points_to_nil
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

end
