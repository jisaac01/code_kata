require 'test/unit'
require 'mocha/setup'

require './game_of_life'
require './matrix'
require './rule_master'

class GameOfLifeTest < Test::Unit::TestCase

  def test_run
    game_conditions = [[0,1,0], [0,0,0], [1,1,0]]

    Matrix.expects(:new).with(game_conditions).returns(:matrix)

    game = GameOfLife.new(game_conditions)
    game.expects(:game_over?).twice.returns(false).then.returns(true)
    game.expects(:tick!).once
    game.run

    assert_equal :matrix, game.instance_variable_get(:@current_matrix)
  end

  def test_game_over?
    assert_equal 100, GameOfLife::ITERATIONS

    game = GameOfLife.new([])
    assert_equal 0, game.instance_variable_get(:@iterations)

    assert !game.send(:game_over?)

    game.instance_variable_set(:@iterations, GameOfLife::ITERATIONS - 1)
    assert !game.send(:game_over?)

    game.instance_variable_set(:@iterations, GameOfLife::ITERATIONS)
    assert game.send(:game_over?)

    GameOfLife.const_set(:ITERATIONS, nil)
    assert !game.send(:game_over?)
  end

  def test_tick__increments_iterations
    game = GameOfLife.new([])
    assert_equal 0, game.instance_variable_get(:@iterations)
    game.send(:tick!)
    assert_equal 1, game.instance_variable_get(:@iterations)
  end

  def test_tick__gives_us_a_new_matrix
    seed_matrix = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]
    new_matrix = Matrix.new([[0,0,0,0],[1,1,1,1],[1,1,1,1],[1,1,1,1]])
    game = GameOfLife.new(seed_matrix)
    current_matrix = game.instance_variable_get(:@current_matrix)
    RuleMaster.expects(:apply_rules).with(current_matrix).returns(new_matrix)
    game.send(:tick!)
    assert_equal new_matrix, game.instance_variable_get(:@current_matrix)
  end

end