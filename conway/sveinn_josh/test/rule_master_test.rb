require 'test/unit'
require 'mocha/setup'

require './rule_master'
require './matrix'
require './cell'

class RuleMasterTest < Test::Unit::TestCase
  def test_apply_rules__iterates_through_each_cell_and_applies
    matrix = Matrix.new([[1, 1, 1], [1]])
    new_cell = ::Cell.new(0)
    RuleMaster.expects(:apply_cell_rules).with(matrix.cell_matrix[0][0]).returns(new_cell)
    RuleMaster.expects(:apply_cell_rules).with(matrix.cell_matrix[0][1]).returns(new_cell)
    RuleMaster.expects(:apply_cell_rules).with(matrix.cell_matrix[0][2]).returns(new_cell)
    RuleMaster.expects(:apply_cell_rules).with(matrix.cell_matrix[1][0]).returns(new_cell)

    new_matrix = RuleMaster.apply_rules(matrix)

    assert_equal Matrix.new([[new_cell, new_cell, new_cell], [new_cell]]), new_matrix
  end

  def test_apply_cell_rules__live__under_two_neighbors__dies
    alive_cell = Cell.new(1)

    matrix = Matrix.new([])
    matrix.expects(:neighbor_count).with(alive_cell).returns(0)

    new_cell = RuleMaster.apply_cell_rules(matrix, alive_cell)
    assert alive_cell.alive?
    assert !new_cell.alive?


    alive_cell = Cell.new(1)

    matrix = Matrix.new([])
    matrix.expects(:neighbor_count).with(alive_cell).returns(1)

    new_cell = RuleMaster.apply_cell_rules(matrix, alive_cell)
    assert alive_cell.alive?
    assert !new_cell.alive?
  end

  def test_apply_cell_rules__live__two_or_three_neighbors__lives
    alive_cell = Cell.new(1)

    matrix = Matrix.new([])
    matrix.expects(:neighbor_count).with(alive_cell).returns(2)

    new_cell = RuleMaster.apply_cell_rules(matrix, alive_cell)
    assert alive_cell.alive?
    assert new_cell.alive?

    alive_cell = Cell.new(1)

    matrix = Matrix.new([])
    matrix.expects(:neighbor_count).with(alive_cell).returns(3)

    new_cell = RuleMaster.apply_cell_rules(matrix, alive_cell)
    assert alive_cell.alive?
    assert new_cell.alive?
  end

  def test_apply_cell_rules__live__three_or_more_neighbors__dies
    alive_cell = Cell.new(1)

    matrix = Matrix.new([])
    matrix.expects(:neighbor_count).with(alive_cell).returns(4)

    new_cell = RuleMaster.apply_cell_rules(matrix, alive_cell)
    assert alive_cell.alive?
    assert !new_cell.alive?


    alive_cell = Cell.new(1)

    matrix = Matrix.new([])
    matrix.expects(:neighbor_count).with(alive_cell).returns(9)

    new_cell = RuleMaster.apply_cell_rules(matrix, alive_cell)
    assert alive_cell.alive?
    assert !new_cell.alive?
  end

  def test_apply_cell_rules__dead__three_neighbors__lives
    dead_cell = Cell.new(0)
    assert !dead_cell.alive?

    matrix = Matrix.new([])
    matrix.expects(:neighbor_count).with(dead_cell).returns(3)

    new_cell = RuleMaster.apply_cell_rules(matrix, dead_cell)
    assert !dead_cell.alive?
    assert new_cell.alive?
  end

  def test_apply_cell_rules__dead__not_three_neighbors__dead
    dead_cell = Cell.new(0)

    matrix = Matrix.new([])
    matrix.expects(:neighbor_count).with(dead_cell).returns(2)

    new_cell = RuleMaster.apply_cell_rules(matrix, dead_cell)
    assert !dead_cell.alive?
    assert !new_cell.alive?

    matrix = Matrix.new([])
    matrix.expects(:neighbor_count).with(dead_cell).returns(4)

    new_cell = RuleMaster.apply_cell_rules(matrix, dead_cell)
    assert !dead_cell.alive?
    assert !new_cell.alive?
  end
end