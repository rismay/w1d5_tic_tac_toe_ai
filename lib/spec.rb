require 'TreeNode'

describe TreeNode do

  before do
    @tree = TreeNode.new("Hello")
  end

  it "has #parent attribute" do
    @tree.should respond_to(:parent)
  end

  it "has #children attribute" do
    @tree.should respond_to(:children)
  end

  it "has #value attribute" do
    @tree.should respond_to(:value)
  end

  it "Responds to add_child" do
    @tree.should respond_to(:add_child)
  end

  it "Responds to remove_child" do
    @tree.should respond_to(:remove_child)
  end

  it "Responds to dfs" do
    @tree.should respond_to(:dfs)
  end

  it "Responds to bfs" do
    @tree.should respond_to(:bfs)
  end

end