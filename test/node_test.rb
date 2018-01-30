require "minitest/autorun"
require "minitest/pride"
require "./lib/node"

class NodeTest < Minitest::Test

    def test_node_can_be_created
        node = Node.new("West")
        assert_equal Node, node.class
        assert_equal "West", node.surname
    end

    def test_node_can_hold_different_data
        node = Node.new("Adams")
        assert_equal Node, node.class
        assert_equal "Adams", node.surname
    end

    def test_next_node_is_nil_by_default
        node = Node.new("West")
        assert_nil node.next_node
    end

end
