require_relative "node.rb"

class Stack
  attr_reader :top

  def initialize
    @top = nil
  end

  def push(value)
    @top = Node.new(value, @top)
  end

  def pop
    return nil if @top.nil?
    top = @top
    @top = top.next_node
    top
  end

  def peek
    @top.nil? ? nil : @top.value
  end

  def is_empty?
    peek ? false : true
  end
end
