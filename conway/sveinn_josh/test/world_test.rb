require 'test/unit'
require 'mocha/setup'

require_relative '../world'

class WorldTest < Test::Unit::TestCase

  def test_run__no_args
    gol = mock({:run => true})
    GameOfLife.expects(:new).with(World::DEFAULT_STARTING_CONFIG).returns(gol)
    World.run
  end

  def test_run__starting_args
    starting_args = [[1,1],[0,0],[1,1]]
    gol = mock({:run => true})
    GameOfLife.expects(:new).with(starting_args).returns(gol)
    World.run starting_args
  end

end