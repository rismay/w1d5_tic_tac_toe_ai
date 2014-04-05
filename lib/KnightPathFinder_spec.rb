require 'KnightPathFinder'

describe KnightPathFinder do

  before do
    @knight = KnightPathFinder.new([0,0])
  end

  it "Has attribute #move_tree" do
    KnightPathFinder.should respond_to(:move_tree)
  end

  it "responds to #build_move_tree" do
    @knight.should respond_to(:build_move_tree)
  end

  it "responds to #new_move_positions" do
    KnightPathFinder.should respond_to(:new_move_positions)
  end

end