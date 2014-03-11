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
end