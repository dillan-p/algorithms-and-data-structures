require_relative "node.rb"

class BinarySearchTree
  attr_reader :root

  def intialize
    @root = nil
  end

  def insert(value)
    return @root = Node.new(value) if @root.nil?
    insert_recursive(@root, value)
  end

  def insert_recursive(node, value)
    if value <= node.value
      if node.left_child.nil?
        node.left_child = Node.new(value)
        node.left_child.parent = node
      else
        insert_recursive(node.left_child, value)
      end
    else
      if node.right_child.nil?
        node.right_child = Node.new(value)
        node.right_child.parent = node
      else
        insert_recursive(node.right_child, value)
      end
    end
  end
end
