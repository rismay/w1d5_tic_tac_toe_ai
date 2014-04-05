require './TicTacToeNode'

  hp = HumanPlayer.new("Ned")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
