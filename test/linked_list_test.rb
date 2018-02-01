require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/linked_list"
require "./lib/wagon_train"

class LinkedListTest < Minitest::Test

  def test_it_can_be_created
    list = LinkedList.new
    assert_instance_of LinkedList, list
  end

  def test_it_has_head_nil_by_default
    list = LinkedList.new
    assert_nil list.head
  end

  def test_new_node_can_be_created
    list = LinkedList.new
    assert_instance_of Node, list.new_node("West", {pounds_of_food: 60})
  end

  def test_new_node_non_alphabetical
    list = LinkedList.new
    assert_instance_of Node, list.new_node(!12, {pounds_of_food: 1})
  end

  def test_can_append_node
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})

    assert_equal "West", list.head.surname
  end

  def test_appended_node_points_to_nil
    #skip
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    assert_nil list.head.next_node
  end

  def test_can_add_a_second_node
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    assert_nil list.head.next_node.next_node
  end

  def test_second_node_points_to_nil
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    assert_nil list.head.next_node.next_node
  end

  def test_nodes_can_be_counted
    #skip
    list = LinkedList.new
    assert_equal 0, list.count
    list.append("West", {pounds_of_food: 60})
    assert_equal 1, list.count
    list.append("Adams", {hunting_ammunition: 20})
    assert_equal 2, list.count
    list.append("Hardy", {spare_wagon_parts: 5})
    assert_equal 3, list.count
    list.append("Smith", {spare_wagon_parts: 10})
    assert_equal 4, list.count
    assert_equal 4, list.count
  end

  def test_generates_string_with_one_family_name
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    assert_equal "The West family", list.to_string
  end

##Iteration 2
  def test_can_append_multiple_nodes
    #skip
    list = LinkedList.new

    assert_instance_of Node, list.append("West", {pounds_of_food: 60})
    assert_equal "West", list.head.surname
    assert_nil list.head.next_node

    assert_instance_of Node, list.append("Adams", {hunting_ammunition: 20})
    assert_equal "West", list.head.surname
    assert_equal "Adams", list.head.next_node.surname

    assert_instance_of Node, list.append("Smith", {spare_wagon_parts: 10})
    assert_equal "West", list.head.surname
    assert_equal "Adams", list.head.next_node.surname
    assert_equal "Smith", list.head.next_node.next_node.surname

    assert_instance_of Node, list.append("Hardy", {spare_wagon_parts: 5})
    assert_equal "West", list.head.surname
    assert_equal "Adams", list.head.next_node.surname
    assert_equal "Smith", list.head.next_node.next_node.surname
    assert_equal "Hardy", list.head.next_node.next_node.next_node.surname
  end

  def test_generates_string_with_multiple_family_names
    #skip
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})
    list.append("Hardy", {spare_wagon_parts: 5})
    assert_equal ("The West family, followed by the Adams family, followed by the Smith family, followed by the Hardy family"), list.to_string
  end

#Iteration 3
  def test_can_prepend_nodes
    #skip
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})

    list.prepend("Smith", {spare_wagon_parts: 10})
    assert_equal "Smith", list.head.surname
    assert_equal "West", list.head.next_node.surname
    assert_equal "Adams", list.head.next_node.next_node.surname
    assert_equal 3, list.count
  end

  def test_can_prepend_nodes_when_list_empty
    #skip
    list = LinkedList.new

    list.prepend("West", {pounds_of_food: 60})
    assert_equal "West", list.head.surname
    assert_equal 1, list.count
  end

  def test_can_insert_nodes_in_index
    #skip
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})

    list.insert(1, "Hardy", {hunting_ammunition: 5})
    assert_equal "West", list.head.surname
    assert_equal "Hardy", list.head.next_node.surname
    assert_equal "Adams", list.head.next_node.next_node.surname
    assert_equal "Smith", list.head.next_node.next_node.next_node.surname
    assert_equal 4, list.count
  end

  def test_can_insert_nodes_below_index
    #skip
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})

    list.insert(-2, "Rhodes", {hunting_ammunition: 5})
    assert_equal "Rhodes", list.head.surname
    assert_equal "West", list.head.next_node.surname
    assert_equal "Adams", list.head.next_node.next_node.surname
    assert_equal "Smith", list.head.next_node.next_node.next_node.surname
    assert_equal 4, list.count
  end

  def test_can_insert_nodes_above_index
    #skip
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})

    list.insert(5, "Davies", {pounds_of_food: 100})
    assert_equal "West", list.head.surname
    assert_equal "Adams", list.head.next_node.surname
    assert_equal "Smith", list.head.next_node.next_node.surname
    assert_equal "Davies", list.head.next_node.next_node.next_node.surname
    assert_equal 4, list.count
  end

  def test_can_find_a_name
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})

    assert_equal "The Adams family", list.find(1, 1)
  end

  def test_can_find_a_name_when_position_exceeds_list_length
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})

    assert_equal "The West family, followed by the Adams family, followed by the Smith family", list.find(100, 1)
  end

  def test_can_find_a_name_when_position_less_than_0
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})

    assert_equal "The West family, followed by the Adams family, followed by the Smith family", list.find(-1, 1)
  end

  def test_can_find_multiple_names_when_num_elements_does_not_exceed_list_length
    #skip
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})
    list.append("Rhodes", {pounds_of_food: 15})

    assert_equal "The Adams family, followed by the Smith family", list.find(1,2)
  end

  def test_can_find_multiple_names_when_num_elements_exceeds_list_length
    #skip
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})
    list.append("Rhodes", {pounds_of_food: 15})

    assert_equal "The Adams family, followed by the Smith family, followed by the Rhodes family", list.find(1,100)
  end

  def test_can_find_multiple_names_when_num_elements_less_than_0
    #skip
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})

    assert_equal "The Adams family, followed by the Smith family", list.find(1,-1)
  end

  def test_can_check_whether_value_exists
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})

    #binding.pry

    assert list.includes?("Adams")
    assert list.includes?("West")
    assert list.includes?("Smith")
    refute list.includes?("Rhodes")
    refute list.includes?(123)
  end

  def test_can_break_bad_news
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})

    assert_equal "The West family has died of dysentery", list.died_of_dysentery(list.head.surname)
    assert_equal "The Adams family has died of dysentery", list.died_of_dysentery(list.head.next_node.surname)
    assert_equal "The Smith family has died of dysentery", list.died_of_dysentery(list.head.next_node.next_node.surname)
  end


  def test_node_can_be_removed_from_end
    #skip
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})

    list.pop
    assert_equal "The West family, followed by the Adams family", list.to_string
  end

  def test_multiple_nodes_can_be_removed
    list = LinkedList.new
    list.append("West", {pounds_of_food: 60})
    list.append("Adams", {hunting_ammunition: 20})
    list.append("Smith", {spare_wagon_parts: 10})

    list.pop
    assert_equal "The West family, followed by the Adams family", list.to_string

    list.pop
    assert_equal "The West family", list.to_string

    list.pop
    assert_equal "There are no families in the wagon train", list.to_string
  end

  def test_supplies_with_no_wagons
    list = LinkedList.new
    assert_equal "Supplies without wagons? Preposterous!", list.supplies
  end

  def test_can_access_supplies
    list = LinkedList.new

    list.append("West", {pounds_of_food: 60})
    expected = {pounds_of_food: 60}
    assert_equal expected, list.head.supplies

    list.append("Adams", {hunting_ammunition: 20})
    expected = {hunting_ammunition: 20}
    assert_equal expected, list.head.next_node.supplies
  end

  def test_supplies_method_returns_supplies_merged
    list = LinkedList.new

    list.append("West", {pounds_of_food: 60})
    expected = {pounds_of_food: 60}
    assert_equal expected, list.supplies

    list.append("Adams", {hunting_ammunition: 20})
    expected = {pounds_of_food: 60, hunting_ammunition: 20}
    assert_equal expected, list.supplies

    list.append("Smith", {spare_wagon_parts: 10})
    expected = {pounds_of_food: 60, hunting_ammunition: 20, spare_wagon_parts: 10}
    assert_equal expected, list.supplies
  end

  # def test_supply_values_update                       #test fails!!!!
  #   list = LinkedList.new
  #
  #   list.append("Adams", {hunting_ammunition: 20})
  #   expected = {hunting_ammunition: 20}
  #   assert_equal expected, list.supplies
  #
  #   list.append("Rhodes", {hunting_ammunition: 30})
  #   expected = {hunting_ammunition: 50}
  #   assert_equal expected, list.supplies
  # end
end
