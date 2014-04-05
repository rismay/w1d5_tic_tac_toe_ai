require './TicTacToe'

class TicTacToeNode
  PLAYERS = [:x, :o]

  attr_accessor :board, :mark, :prev_move_pos, :next

  def initialize(options={})
    self.board = options[:board]
    self.mark = options[:mark]
    self.prev_move_pos = options[:prev_move_pos]
  end

  def children
    childs = []

    3.times do |i|
      3.times do |j|
        if self.board.empty?[i,j]
          new_board = self.board.dup
          new_mark = (PLAYERS - [self.mark]).first
          new_board[[i, j] , self.mark]
          childs << TicTacToeNode.new(
          board: new_board,
          mark: new_mark,
          prev_move_pos: [i, j]
          )
        end
      end
    end

    childs
  end

  def winning_node?(player)
    return true if self.board.over? && self.board.won? && (self.board.winner == player)

    childs = children
    other_player = (PLAYERS - [self.mark]).first
    return true if childs.any? {|cnode| cnode.winning_node?(player) }
    return true if childs.all? {|cnode| cnode.losing_node?(other_player) }
    false
  end

  def losing_node?(player)
    return true if (self.board.won? && (self.board.winner != player))
    childs = children
    other_player = (PLAYERS - [self.mark]).first
    return true if childs.all? {|cnode| cnode.losing_node?(player) }
    return true if childs.any? {|cnode| cnode.winning_node?(other_player)}
    false
  end

end


class SuperComputerPlayer < ComputerPlayer

  def move(new_game, new_mark)
    node = TicTacToeNode.new(board: new_game,mark: new_mark)

    possible_moves = node.children.select do |child|
      !child.losing_node?(player)
    end

    if possible_moves
      possible_moves.each do |child|
        if move.winning_node?(player)
          return child.prev_move_pos
        end
      end
    end
  end

end

