require 'test/unit'
require 'mocha/setup'

require_relative '../game_of_life'
require_relative '../matrix'
require_relative '../rule_master'

class GameOfLifeTest < Test::Unit::TestCase

  def test_draw
    game = GameOfLife.new([])
    game.instance_variable_get(:@current_matrix).expects(:draw)
    game.draw
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
    time = Time.now
    Time.stubs(:now).returns(time)
    game = GameOfLife.new([])
    assert_equal 0, game.instance_variable_get(:@iterations)
    Time.stubs(:now).returns(time + 1)
    game.send(:tick!)
    assert_equal 1, game.instance_variable_get(:@iterations)
  end

  def test_tick__does_nothing_in_less_than_a_second
    time = Time.now
    Time.stubs(:now).returns(time)
    game = GameOfLife.new([])
    assert_equal 0, game.instance_variable_get(:@iterations)
    Time.stubs(:now).returns(time + 0.49)
    game.send(:tick!)
    assert_equal 0, game.instance_variable_get(:@iterations)
    Time.stubs(:now).returns(time + 0.5)
    game.send(:tick!)
    assert_equal 1, game.instance_variable_get(:@iterations)
  end

  def test_tick__gives_us_a_new_matrix
    time = Time.now
    Time.stubs(:now).returns(time)

    seed_matrix = [[1,1,1,1],[1,1,1,1],[1,1,1,1],[1,1,1,1]]
    new_matrix = Matrix.new([[0,0,0,0],[1,1,1,1],[1,1,1,1],[1,1,1,1]])
    game = GameOfLife.new(seed_matrix)

    Time.stubs(:now).returns(time + 1)
    current_matrix = game.instance_variable_get(:@current_matrix)
    RuleMaster.expects(:apply_rules).with(current_matrix).returns(new_matrix)
    game.send(:tick!)
    assert_equal new_matrix, game.instance_variable_get(:@current_matrix)
  end

end