require './TreeNode'

class KnightPathFinder
  attr_accessor :begin_pos, :move_tree, :moves_array

  def initialize(pos = [0,0])
    self.begin_pos = pos
    self.move_tree = build_move_tree(self.begin_pos)
  end

  def find_path(end_pos)
    moves = []

    p node = self.move_tree.bfs(end_pos)

    until node.parent.nil?
      moves << [node]
      node = node.parent
    end

    moves.reverse
  end

  def build_move_tree(move_pos)
    m_tree = TreeNode.new(move_pos)
    nodes = [m_tree]
    visited_positions = []

    until nodes.empty?
      current_tree = nodes.shift
      current_pos = current_tree.value
      visited_positions << current_pos

      pos_positions = self.class.new_move_positions(current_pos) - visited_positions

      pos_positions.each do |pos|
        sub_tree = TreeNode.new(pos)
        current_tree.add_child(sub_tree)
      end
    end

    m_tree
  end

  def self.new_move_positions(pos)
    arr = [[1,2],[2,1],[-1,2],[-2,1],[1,-2],[2,-1],[-1,-2],[-2,-1]].map do |move|
      [pos[0] + move[0], pos[1] + move[1]]
    end
    pruned_array = arr.select do |posmove|
      posmove[0].between?(0,7) && posmove[1].between?(0,7)
    end

    p "Pruned Array: " + pruned_array.to_s
    pruned_array
  end
end

k = KnightPathFinder.new([0,0])
p "KNIGHTPATHFINDER: " + k.find_path([2,1]).to_s

