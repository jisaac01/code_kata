require_relative 'cell_matrix_factory'
require_relative 'random_cell_factory'

require_relative 'ascii_matrix_renderer'
require_relative 'ascii_cell_renderer'


matrix = CellMatrixFactory.new(RandomCellFactory.new(0.1)).create_matrix(20, 20)
matrix_renderer = AsciiMatrixRenderer.new(AsciiCellRenderer.new)
matrix_renderer.render(matrix, $stdout)
