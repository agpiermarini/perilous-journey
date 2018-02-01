require "./lib/node"
require "./lib/linked_list"

class WagonTrain

  attr_accessor :list

  def initialize
    @list = LinkedList.new
  end

end
