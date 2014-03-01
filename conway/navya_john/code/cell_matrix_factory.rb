require_relative 'dense_matrix'


class CellMatrixFactory

  def initialize(cell_factory)
    @cell_factory = cell_factory
  end

  def create_matrix(width, height)
    matrix = DenseMatrix.new(width, height)
    matrix.each_value do |x, y, value|
      matrix.set(x, y, @cell_factory.create_cell)
    end

    matrix
  end

end
