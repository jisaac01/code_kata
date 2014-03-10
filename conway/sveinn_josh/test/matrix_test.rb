require './matrix'
require 'test/unit'

class MatrixTest < Test::Unit::TestCase

  def test_initialize__with_arrays
    seed_matrix = [[0,1,0], [0,0,0], [0,0,1]]
    matrix = Matrix.new(seed_matrix)

    assert_equal seed_matrix, matrix.instance_variable_get(:@seed_matrix)

    actual_cell_matrix = matrix.cell_matrix
    actual_cell_matrix.each do |row|
      row.each {|cell| assert cell.is_a?(Cell)}
    end

    expected_alive_matrix = [[false,true,false], [false,false,false], [false,false,true]]

    actual_alive_matrix = actual_cell_matrix.map do |row|
      row.map {|cell| cell.alive?}
    end

    assert_equal expected_alive_matrix, actual_alive_matrix
  end


end