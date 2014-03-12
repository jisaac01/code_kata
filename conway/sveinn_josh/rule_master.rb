class RuleMaster

  def self.apply_rules(matrix)
    result = matrix.cell_matrix.map.with_index do |row, i|
      row.map.with_index do |cell, j|
        apply_cell_rules(matrix, i, j)
      end
    end
    Matrix.new(result)
  end

  def self.apply_cell_rules(matrix, i, j)
    neighbor_count = matrix.neighbor_count(i, j)
    new_cell = Cell.new(matrix.cell_matrix[i][j].alive?)

    if neighbor_count < 2 # rule 1
      new_cell.kill
    elsif neighbor_count == 3 # rule 4
      new_cell.revive
    elsif neighbor_count > 3
      new_cell.kill
    end

    new_cell
  end
end