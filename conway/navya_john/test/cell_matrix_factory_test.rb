require_relative '../code/cell_matrix_factory'
require 'test/unit'


class CellMatrixFactoryTest < Test::Unit::TestCase
  def test_create_matrix
    mock_cell_factory = mock('mock cell factory')
    mock_cell_factory.stubs(:create_cell).returns(true)

    matrix_factory = CellMatrixFactory.new(mock_cell_factory)
    matrix = matrix_factory.create_matrix(10, 10)
    matrix.each_value do |x, y, value|
      assert value
    end
  end
end
