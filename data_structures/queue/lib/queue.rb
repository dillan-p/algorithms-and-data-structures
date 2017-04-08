require_relative "node.rb"

class Queue
  attr_reader :head, :tail

  def initalize
    @head = nil
    @tail = nil
  end

  def enqueue(value)
    node = Node.new(value)
    if @head.nil? && @tail.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def dequeue
    return nil if @head.nil? && @tail.nil?
    value = @head.value
    if @head == @tail
      @head = nil
      @tail = nil
    else
      @head = @head.next_node
    end
    value
  end
end
