require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/wagon_train"

class WagonTrainTest < Minitest::Test

  def test_it_can_be_created
    wt = WagonTrain.new
    assert_instance_of WagonTrain, wt
  end

  def test_it_creates_instance_of_linked_list
    wt = WagonTrain.new
    assert_instance_of LinkedList, wt.list
  end

  def test_it_has_linked_list_head_nil_by_default
    wt = WagonTrain.new
    assert_nil wt.list.head
  end

  def test_it_can_append_node
    wt = WagonTrain.new
    assert_instance_of Node, wt.append("West", {pounds_of_food: 60})
  end

  def test_it_can_call_node_surname
    wt = WagonTrain.new
    assert_equal "West", wt.append("West", {pounds_of_food: 60}).surname
  end

  def test_it_can_append_a_second_name
    wt = WagonTrain.new
    assert_instance_of Node, wt.append("Adams", {hunting_ammunition: 20})
  end

  def test_it_can_count
    wt = WagonTrain.new
    wt.append("West", {pounds_of_food: 60})
    wt.append("Adams", {hunting_ammunition: 20})
    assert_equal 2, wt.count
  end

  def test_it_can_remove_nodes
    wt = WagonTrain.new
    wt.append("West", {pounds_of_food: 60})
    wt.append("Adams", {hunting_ammunition: 20})
    wt.append("Smith",{spare_wagon_parts: 10})
    wt.list.pop
    assert_equal 2, wt.count
    assert_equal "The West family, followed by the Adams family", wt.list.to_string
  end

  def test_it_can_return_supples
    wt = WagonTrain.new
    wt.append("West", {pounds_of_food: 60})
    wt.append("Adams", {hunting_ammunition: 20})
    wt.append("Smith",{spare_wagon_parts: 10})

    expected = {pounds_of_food: 60, hunting_ammunition: 20, spare_wagon_parts: 10}
    assert_equal expected, wt.supplies
  end

  def test_it_sums_supply_values_of_same_keys
    wt = WagonTrain.new
    wt.append("West", {pounds_of_food: 60})
    wt.append("Adams", {hunting_ammunition: 20})
    wt.append("Smith", {pounds_of_food: 10})
    wt.append("Rhodes", {spare_wagon_parts: 10} )

    expected = {pounds_of_food: 70, hunting_ammunition: 20, spare_wagon_parts: 10}
    assert_equal expected, wt.supplies
  end

end
