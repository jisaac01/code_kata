require_relative "cell"
require_relative "gosu_drawer"

class Matrix

  attr_reader :cell_matrix

  def initialize(seed_matrix)
    @seed_matrix = seed_matrix
    @cell_matrix = generate_cell_matrix
    @matrix_drawer = GosuDrawer.new
  end

  def ==(other)
    return false unless self.cell_matrix && other.cell_matrix
    @cell_matrix.each_with_index do |row, i|
      return false unless other.cell_matrix[i] && row.length == other.cell_matrix[i].length
      row.each_with_index do |cell, j|
        unless self.cell_exists?(i,j) &&
               other.cell_exists?(i,j) &&
               cell_matrix[i][j].alive? == other.cell_matrix[i][j].alive?
          return false
        end
      end
    end
    true
  end

  def neighbor_count(x, y)
    neighbors = 0
    [-1,0,1].each do |x_offset|
      [-1,0,1].each do |y_offset|
        next if 0 == x_offset && 0 == y_offset
        neighbors += 1 if cell_alive?(x + x_offset, y + y_offset)
      end
    end
    neighbors
  end

  def draw
    @matrix_drawer.draw(cell_matrix)
  end

  def to_s
    cell_matrix.map do |row|
      row.map do |cell|
        cell.to_s
      end
    end.join(',')
  end

  protected

  def cell_exists?(i,j)
      i >= 0 && j >= 0 &&  cell_matrix && i < cell_matrix.length && cell_matrix[i] &&
        j < cell_matrix[i].length && cell_matrix[i][j] &&
        cell_matrix[i][j].respond_to?(:alive?)
  end

  def cell_alive?(i,j)
    cell_exists?(i,j) && cell_matrix[i][j].alive?
  end
  private

  def generate_cell_matrix
    @cell_matrix = @seed_matrix.map do |row|
      row.map { |doa| Cell.new(doa) }
    end
  end

end