require 'linked_list_item'  

class LinkedList
  attr_reader :first_item  

  def initialize *args
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
      payloads += current_item.payload
      payloads += "," unless current_item.last?
      current_item = current_item.next_list_item
    end
    "|#{payloads} |"
  end

  # ========= Bonus ========== #

  # def [](payload)
  # end

  # def []=(n, payload)
  # end/

  # def remove(n)
  # end

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

#sort test

  def sorted?
    item = @first_item
    (size-1).times do
      if item <= item.next_list_item
        item = item.next_list_item 
      end
      return false
    end
    true
  end

  def sort(list)
    
  end

  # This is a helper I implemented
  def swap_with_next(node_a)
    node_b = node_a.next_list_item
    node_c = node_b.next_list_item
    node_a.next_list_item= node_c
    node_b.next_list_item= node_a
    node_b
  end

# Call this method like this
# node.next_list_item= swap_with_next node.next_list_item

end