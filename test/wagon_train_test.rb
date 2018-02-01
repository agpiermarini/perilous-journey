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
    assert_instance_of Node, wt.list.append("West")
  end

  def test_it_can_call_node_surname
    wt = WagonTrain.new
    assert_equal "West", wt.list.append("West").surname
  end

  def test_it_can_append_a_second_name
    wt = WagonTrain.new
    assert_instance_of Node, wt.list.append("Adams")
  end

  def test_it_can_count
    wt = WagonTrain.new
    wt.list.append("West")
    wt.list.append("Adams")
    assert_equal 2, wt.list.count
  end

  def test_it_can_remove_nodes
    wt = WagonTrain.new
    wt.list.append("West")
    wt.list.append("Adams")
    wt.list.append("Smith")
    wt.list.pop
    assert_equal 2, wt.list.count
    assert_equal "The West family, followed by the Adams family", wt.list.to_string
  end

end
