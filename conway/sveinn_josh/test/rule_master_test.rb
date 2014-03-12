require 'test/unit'
require 'mocha/setup'

require './rule_master'
require './matrix'
require './cell'

class RuleMasterTest < Test::Unit::TestCase
  def test_apply_rules__iterates_through_each_cell_and_applies
    matrix = Matrix.new([[1, 1, 1], [1]])
    new_cell = ::Cell.new(0)
    RuleMaster.expects(:apply_cell_rules).with(matrix, 0, 0).returns(new_cell)
    RuleMaster.expects(:apply_cell_rules).with(matrix, 0, 1).returns(new_cell)
    RuleMaster.expects(:apply_cell_rules).with(matrix, 0, 2).returns(new_cell)
    RuleMaster.expects(:apply_cell_rules).with(matrix, 1, 0).returns(new_cell)

    new_matrix = RuleMaster.apply_rules(matrix)

    assert_equal Matrix.new([[new_cell, new_cell, new_cell], [new_cell]]), new_matrix
  end

  def test_apply_cell_rules__live__under_two_neighbors__dies
    matrix = Matrix.new([[0,0,0],[0,1,0]])
    matrix.expects(:neighbor_count).with(1, 1).returns(0)

    new_cell = RuleMaster.apply_cell_rules(matrix, 1, 1)
    assert matrix.cell_matrix[1][1].alive?
    assert !new_cell.alive?


    matrix = Matrix.new([[0,0,0],[0,1,0]])
    matrix.expects(:neighbor_count).with(1, 1).returns(1)

    new_cell = RuleMaster.apply_cell_rules(matrix, 1, 1)
    assert matrix.cell_matrix[1][1].alive?
    assert !new_cell.alive?
  end

  def test_apply_cell_rules__live__two_or_three_neighbors__lives
    matrix = Matrix.new([[0,0,0],[0,1,0]])
    matrix.expects(:neighbor_count).with(1, 1).returns(2)

    new_cell = RuleMaster.apply_cell_rules(matrix, 1, 1)
    assert matrix.cell_matrix[1][1].alive?
    assert new_cell.alive?

    matrix = Matrix.new([[0,0,0],[0,1,0]])
    matrix.expects(:neighbor_count).with(1, 1).returns(3)

    new_cell = RuleMaster.apply_cell_rules(matrix, 1, 1)
    assert matrix.cell_matrix[1][1].alive?
    assert new_cell.alive?
  end

  def test_apply_cell_rules__live__three_or_more_neighbors__dies
    matrix = Matrix.new([[0,0,0],[0,1,0]])
    matrix.expects(:neighbor_count).with(1, 1).returns(4)

    new_cell = RuleMaster.apply_cell_rules(matrix, 1, 1)
    assert matrix.cell_matrix[1][1].alive?
    assert !new_cell.alive?


    matrix = Matrix.new([[0,0,0],[0,1,0]])
    matrix.expects(:neighbor_count).with(1, 1).returns(9)

    new_cell = RuleMaster.apply_cell_rules(matrix, 1, 1)
    assert matrix.cell_matrix[1][1].alive?
    assert !new_cell.alive?
  end

  def test_apply_cell_rules__dead__three_neighbors__lives
    matrix = Matrix.new([[0,0,0],[0,0,0]])
    assert !matrix.cell_matrix[1][1].alive?

    matrix.expects(:neighbor_count).with(1, 1).returns(3)

    new_cell = RuleMaster.apply_cell_rules(matrix, 1, 1)
    assert !matrix.cell_matrix[1][1].alive?
    assert new_cell.alive?
  end

  def test_apply_cell_rules__dead__not_three_neighbors__dead
    matrix = Matrix.new([[0,0,0],[0,0,0]])
    assert !matrix.cell_matrix[1][1].alive?
    matrix.expects(:neighbor_count).with(1, 1).returns(2)

    new_cell = RuleMaster.apply_cell_rules(matrix, 1, 1)
    assert !matrix.cell_matrix[1][1].alive?
    assert !new_cell.alive?

    matrix = Matrix.new([[0,0,0],[0,0,0]])
    matrix.expects(:neighbor_count).with(1, 1).returns(4)

    new_cell = RuleMaster.apply_cell_rules(matrix, 1, 1)
    assert !matrix.cell_matrix[1][1].alive?
    assert !new_cell.alive?
  end
end