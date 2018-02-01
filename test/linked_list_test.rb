require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/linked_list"
require "./lib/wagon_train"

class LinkedListTest < Minitest::Test

    def test_it_can_be_created
        list = LinkedList.new
        assert_equal LinkedList, list.class
    end

    def test_it_has_head_nil_by_default
        list = LinkedList.new
        assert_nil list.head
    end

    def test_new_node_can_be_created
      list = LinkedList.new
      assert_instance_of Node, list.new_node("West")
    end

    def test_new_node_non_alphabetical
      list = LinkedList.new
      assert_instance_of Node, list.new_node(!12)
    end

    def test_can_append_node
        list = LinkedList.new
        list.append("West")

        assert_equal "West", list.head.surname
    end

    def test_appended_node_points_to_nil
        #skip
        list = LinkedList.new
        list.append("West")
        assert_nil list.head.next_node
    end

    def test_can_add_a_second_node
      list = LinkedList.new
      list.append("West")
      list.append("Adams")
      assert_nil list.head.next_node.next_node
    end

    def test_second_node_points_to_nil
      list = LinkedList.new
      list.append("West")
      list.append("Adams")
      assert_nil list.head.next_node.next_node
    end

    def test_nodes_can_be_counted
        #skip
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

    def test_generates_string_with_one_family_name
        list = LinkedList.new
        list.append("West")
        assert_equal "The West family", list.to_string
    end

##Iteration 2
    def test_can_append_multiple_nodes
        #skip
        list = LinkedList.new

        assert_instance_of Node, list.append("West") #do i need assert_instance_of
        assert_equal "West", list.head.surname
        assert_nil list.head.next_node

        assert_instance_of Node, list.append("Adams")
        assert_equal "West", list.head.surname
        assert_equal "Adams", list.head.next_node.surname

        assert_instance_of Node, list.append("Smith")
        assert_equal "West", list.head.surname
        assert_equal "Adams", list.head.next_node.surname
        assert_equal "Smith", list.head.next_node.next_node.surname

        assert_instance_of Node, list.append("Hardy")
        assert_equal "West", list.head.surname
        assert_equal "Adams", list.head.next_node.surname
        assert_equal "Smith", list.head.next_node.next_node.surname
        assert_equal "Hardy", list.head.next_node.next_node.next_node.surname
    end

    def test_generates_string_with_multiple_family_names
        #skip
        list = LinkedList.new
        list.append("West")
        list.append("Adams")
        list.append("Smith")
        list.append("Hardy")
        assert_equal ("The West family, followed by the Adams family, followed by the Smith family, followed by the Hardy family"), list.to_string
    end

#Iteration 3
    def test_can_prepend_nodes
        #skip
        list = LinkedList.new
        list.append("West")
        list.append("Adams")

        list.prepend("Smith")
        assert_equal "Smith", list.head.surname
        assert_equal "West", list.head.next_node.surname
        assert_equal "Adams", list.head.next_node.next_node.surname
        assert_equal 3, list.count
    end

    def test_can_prepend_nodes_when_list_empty
        #skip
        list = LinkedList.new

        list.prepend("West")
        assert_equal "West", list.head.surname
        assert_equal 1, list.count
    end

    def test_can_insert_nodes_in_index
        #skip
        list = LinkedList.new
        list.append("West")
        list.append("Adams")
        list.append("Smith")

        list.insert(1, "Hardy")
        assert_equal "West", list.head.surname
        assert_equal "Hardy", list.head.next_node.surname
        assert_equal "Adams", list.head.next_node.next_node.surname
        assert_equal "Smith", list.head.next_node.next_node.next_node.surname
        assert_equal 4, list.count
    end

    def test_can_insert_nodes_below_index
        #skip
        list = LinkedList.new
        list.append("West")
        list.append("Adams")
        list.append("Smith")

        list.insert(-2, "Rhodes")
        assert_equal "Rhodes", list.head.surname
        assert_equal "West", list.head.next_node.surname
        assert_equal "Adams", list.head.next_node.next_node.surname
        assert_equal "Smith", list.head.next_node.next_node.next_node.surname
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
        assert_equal 4, list.count
    end

    def test_can_find_a_name
      list = LinkedList.new
      list.append("West")
      list.append("Adams")
      list.append("Smith")

      assert_equal "The Adams family", list.find(1, 1)
    end

    def test_can_find_a_name_when_position_exceeds_list_length
      list = LinkedList.new
      list.append("West")
      list.append("Adams")
      list.append("Smith")

      assert_equal "The West family, followed by the Adams family, followed by the Smith family", list.find(100, 1)
    end

    def test_can_find_a_name_when_position_less_than_0
      list = LinkedList.new
      list.append("West")
      list.append("Adams")
      list.append("Smith")

      assert_equal "The West family, followed by the Adams family, followed by the Smith family", list.find(-1, 1)
    end

    def test_can_find_multiple_names_when_desired_does_not_exceed_list_length
      #skip
      list = LinkedList.new
      list.append("West")
      list.append("Adams")
      list.append("Smith")
      list.append("Rhodes")

      assert_equal "The Adams family, followed by the Smith family", list.find(1,2)
    end

    def test_can_find_multiple_names_when_desired_exceeds_list_length
      #skip
      list = LinkedList.new
      list.append("West")
      list.append("Adams")
      list.append("Smith")
      list.append("Rhodes")

      assert_equal "The Adams family, followed by the Smith family, followed by the Rhodes family", list.find(1,100)
    end

    def test_can_find_multiple_names_when_desired_less_than_0
      #skip
      list = LinkedList.new
      list.append("West")
      list.append("Adams")
      list.append("Smith")

      assert_equal "The Adams family, followed by the Smith family", list.find(1,-1)
    end

    def test_can_check_whether_value_exists
      list = LinkedList.new
      list.append("West")
      list.append("Adams")
      list.append("Smith")

      #binding.pry

      assert list.includes?("Adams")
      assert list.includes?("West")
      assert list.includes?("Smith")
      refute list.includes?("Rhodes")
      refute list.includes?(123)
    end

    def test_can_break_bad_news
      list = LinkedList.new
      list.append("West")
      list.append("Adams")
      list.append("Smith")

      assert_equal "The West family has died of dysentery", list.died_of_dysentery(list.head.surname)
      assert_equal "The Adams family has died of dysentery", list.died_of_dysentery(list.head.next_node.surname)
      assert_equal "The Smith family has died of dysentery", list.died_of_dysentery(list.head.next_node.next_node.surname)
    end


    def test_node_can_be_removed_from_end
      #skip
      list = LinkedList.new
      list.append("West")
      list.append("Adams")
      list.append("Smith")

      list.pop
      assert_equal "The West family, followed by the Adams family", list.to_string
    end

    def test_multiple_nodes_can_be_removed
      list = LinkedList.new
      list.append("West")
      list.append("Adams")
      list.append("Smith")

      list.pop
      assert_equal "The West family, followed by the Adams family", list.to_string

      list.pop
      assert_equal "The West family", list.to_string

      list.pop
      assert_equal "There are no families in the wagon train", list.to_string
    end

end
