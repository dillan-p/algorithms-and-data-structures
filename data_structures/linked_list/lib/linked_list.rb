require_relative "node.rb"

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def prepends(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def appends(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      tail = @head
      tail = tail.next_node until tail.next_node == nil
      tail.next_node = node
    end
  end

  def find(value)
    curr_node = @head
    until curr_node.nil? #don't need initial line returning nil if head == nil
      return curr_node if curr_node.value == value
      curr_node = curr_node.next_node
    end
  end

  def delete(value) #if there is more than one of value, can loop it wih find.
    return nil if @head.nil?
    if @head.value == value
      @head = @head.next_node
      return
    else
      curr_node = @head
      until curr_node.next_node == nil
        if curr_node.next_node.value == value
          curr_node.next_node = curr_node.next_node.next_node
          return
        end
        curr_node = curr_node.next_node
      end
    end
  end

  def length
    length = 0
    curr = @head
    until curr == nil
      length += 1
      curr = curr.next_node
    end
    length
  end

  def prints
    curr = @head
    node_index = 0
    until curr == nil
      puts "Node [#{node_index}]: #{curr.value}"
      node_index += 1
      curr = curr.next_node
    end
  end
end
