
class LinkedListItem  
  include Comparable
  attr_reader :next_list_item
  attr_reader :payload  

  def initialize(payload)
    @payload = payload 
  end

  def next_list_item= (linked_list_item)
    raise ArgumentError if linked_list_item === self
    @next_list_item = linked_list_item
   end

  def last?
    next_list_item.nil?
  end

  def === other_item
    self.object_id == other_item.object_id
  end

  def <=> other
    if self.payload.class == other.payload.class
      return self.payload <=> other.payload
    elsif self.payload.class == Fixnum
      return -1
    elsif other.payload.class == Fixnum
      return 1
    elsif self.payload.class == String
      return -1
    elsif other.payload.class == String
      return 1
    end
    0
  end
end
