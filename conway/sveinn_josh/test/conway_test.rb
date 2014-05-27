# Need to stub this out so it doesn't create a window somehow

#require 'test/unit'
#require 'mocha/setup'
#
#require_relative '../conway'
#
#class ConwayTest < Test::Unit::TestCase
#
#  def test_run__no_args
#    gol = mock({:run => true})
#    GameOfLife.expects(:new).with(Conway::DEFAULT_STARTING_CONFIG).returns(gol)
#    conway = Conway.new
#
#    Conway.run
#  end
#
#  def test_run__starting_args
#    starting_args = [[1,1],[0,0],[1,1]]
#    gol = mock({:run => true})
#    GameOfLife.expects(:new).with(starting_args).returns(gol)
#    Conway.run starting_args
#  end
#
#end