class Node 
  attr_accessor :value, :forth, :back 

  def initialize(value, forth, back)
    @value = value
    @forth = forth
    @back = back 
  end

end 

class List
  attr_reader :head 
  def initialize
    @tail = nil
    @head = nil 
  end

  def delete(node)
    if node == @head
      @head = node.forth
    end 
    node.back.forth = node.forth unless node.back.nil?
    node.forth.back = node.back unless node.forth.nil?
  end  

  def add(value)
    new_node = Node.new(value, nil, @tail)
    @head = new_node if head.nil?
    @tail.forth = new_node unless @tail.nil?
    @tail = new_node
  end

  def count
    total = 0
    node = @head
    while !node.nil?
      puts node.value
      node = node.forth
      total += 1
    end
    puts "Total: #{total}"
  end

  def dedupe
    current_node = head
    dupes = [] 
    while(!current_node.nil?) do 
      value = current_node.value
      next_node = current_node.forth

      if dupes.include? value 
        delete(current_node)
      else 
        dupes << value 
      end

      # PHASE 2 -- Without array 

      # while(!checker.nil?) do
      #   if value == checker.value 
      #     delete(current_node)
      #     break
      #   end 
      #   checker = checker.forth
      # end  


      current_node = next_node

    end 
  end 
end

@list = List.new 
200.times do |i|
  @list.add(rand(100))
end 

@list.count
@list.dedupe
@list.count
