require 'linked_list_item'  

class LinkedList
  attr_reader :first_item  

  def initialize *arg
    current_item = nil
    arg.each do |payload|
      new_node = LinkedListItem.new(payload)
      if @first_item.nil?
        @first_item = new_node
      else
        current_item.next_list_item= new_node
      end
      current_item = new_node
    end
  end
 
  def add_item(payload)
    next_item = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = next_item
    else
      final_item = @first_item
      until final_item.last?
        final_item = final_item.next_list_item
      end
      final_item.next_list_item = next_item
    end
  end 

  # def get_item(n)
  #   raise IndexError if n < 0
  #   item = @first_item
  #   n.times do
  #     raise IndexError if item.nil?
  #     item = item.next_list_item
  #   end
  #   item
  # end

  # def get(n)
  #   get_item(n).payload
  # end

  def get(n)
    item = @first_item
    n.times do
      raise IndexError if item.nil?
      item = item.next_list_item
    end
    item.payload
  end

  def last
    item = @first_item
    return nil if item.nil?
    until item.last?
      item = item.next_list_item
    end
     item.payload
  end

  def size
    item = @first_item
    size = 0
    until item.nil?
      item = item.next_list_item
      size += 1
    end
    size
  end

  def to_s
    current_item = @first_item
    payloads = ""
    while current_item
      payloads += " "
      payloads += current_item.payload.to_s
      payloads += "," unless current_item.last?
      current_item = current_item.next_list_item
    end
    "|#{payloads} |"
  end

  # ========= Bonus ========== #

  # def [](payload)
  # end

  # def []=(n, payload)
  # end

  # def remove(n)
  # end

 # ========= Index ========== #

  def indexOf(index_item)
    item = @first_item
    size.times do |index|  
      if item.payload == index_item
        return index # explicit return breaks out of loops and method
      end
      item = item.next_list_item
    end
    nil
  end

  # ========= Sort ========== #

  def sorted?
    item = @first_item
    (size-1).times do
      if item > item.next_list_item
        return false
      end
      item = item.next_list_item 
    end
    true
  end

  def sort
    new_first = nil
    new_current = nil

    (self.size).times do
      node = @first_item

      pre_start = LinkedListItem.new("")
      pre_start.next_list_item= node
      parent = pre_start

      min_node = node
      min_parent = parent

      while !node.nil?
        if node < min_node
          min_node = node
          min_parent = parent
        end
        parent, node = node, node.next_list_item
      end

      if new_first.nil?
        new_first = min_node
      else
        new_current.next_list_item= min_node
      end
      min_parent.next_list_item= min_node.next_list_item
      new_current = min_node
      @first_item = pre_start.next_list_item
    end

    @first_item = new_first
    self
  end

# Call this method like this
# node.next_list_item= swap_with_next node.next_list_item
  def swap_with_next(node_a)
    node_b = node_a.next_list_item
    node_c = node_b.next_list_item
    node_a.next_list_item= node_c
    node_b.next_list_item= node_a
    node_b
  end

  # def swap_with_next i #0
  #   current_item = get_item(i)
  #   next_item = get_item(i+1)

  #   if i - 1 >= 0
  #     previous_item = get_item(i-1) # Error
  #     previous_item.next_list_item = next_item
  #   else
  #     @first_item = next_item
  #   end

  #   current_item.next_list_item = next_item.next_list_item
  #   next_item.next_list_item = current_item
  #   # @first_item = next_item
  # end


end