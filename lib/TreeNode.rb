class TreeNode
  attr_accessor :parent, :children, :value

  def initialize(value = nil, children = [])
    self.value = value
    self.children = children
    self.parent = nil
  end

  def remove_child(child_node)
    self.children.delete(child_node)
    child_node.parent = nil
  end

  def add_child(child_node)
    child_node.parent = self
    p self.children.push(child_node) if !child_node.nil?
  end

  def dfs(val)

    return nil if (val == nil)
    return self if (val == self.value)

    self.children.each do |child|
      d = child.dfs(value)
      return d if d
    end
  end

  def bfs(value)
    queue = []
    queue.push(self)

    until queue.empty?
      temp = queue.shift
      if temp.value == value
        return temp
      else
        temp.children.each { |child| queue.push(child) }
      end
    end

  end

end

#
# t = TreeNode.new("Hello")
# c = TreeNode.new("World")
# p "Search for World: " + t.dfs("World").to_s
# t.add_child(c)
# #p t.remove_child(c)
# p "Search for world: " + t.dfs("world").to_s
# p "Search for Hello: " + t.dfs("Hello").to_s
#
# a = TreeNode.new("Hello")
# b = TreeNode.new("World")
# p "Search for World: " + a.bfs("World").to_s
# a.add_child(b)
# #p t.remove_child(c)
# p "Search for world: " + a.bfs("world").to_s
# p "Search for Hello: " + a.bfs("Hello").to_s