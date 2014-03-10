require 'test/unit'
require 'mocha/setup'

require './rule_master'
require './matrix'
require './cell'

class RuleMasterTest < Test::Unit::TestCase
  def test_apply_rules__iterates_through_each_cell_and_applies
    cell = ::Cell.new(1)
    cell2 = ::Cell.new(1)
    cell3 = ::Cell.new(1)
    cell4 = ::Cell.new(1)
    matrix = [[:cell, :cell2, :cell3], [:cell4]]
    new_cell = ::Cell.new(0)
    RuleMaster.expects(:apply_cell_rules).with(:cell).returns(new_cell)
    RuleMaster.expects(:apply_cell_rules).with(:cell2).returns(new_cell)
    RuleMaster.expects(:apply_cell_rules).with(:cell3).returns(new_cell)
    RuleMaster.expects(:apply_cell_rules).with(:cell4).returns(new_cell)

    new_matrix = RuleMaster.apply_rules(matrix)

    assert_equal Matrix.new([[new_cell, new_cell, new_cell], [new_cell]]), new_matrix
  end
end