require './cell'

class Matrix

  attr_reader :cell_matrix

  def initialize(seed_matrix)
    @seed_matrix = seed_matrix
    @cell_matrix = generate_cell_matrix
  end

private

  def generate_cell_matrix
    @cell_matrix = @seed_matrix.map do |row|
      row.map {|doa| Cell.new(doa)}
    end
  end

end