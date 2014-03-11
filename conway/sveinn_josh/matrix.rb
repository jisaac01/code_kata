require "#{File.dirname(__FILE__)}/cell"

class Matrix

  attr_reader :cell_matrix

  def initialize(seed_matrix)
    @seed_matrix = seed_matrix
    @cell_matrix = generate_cell_matrix
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

  protected

  def cell_exists?(i,j)
    cell_matrix && cell_matrix[i] && cell_matrix[i][j] && cell_matrix[i][j].respond_to?(:alive?)
  end

  private

  def generate_cell_matrix
    @cell_matrix = @seed_matrix.map do |row|
      row.map { |doa| Cell.new(doa) }
    end
  end

end