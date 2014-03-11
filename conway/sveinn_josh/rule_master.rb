class RuleMaster

  def self.apply_rules(matrix)
    result = matrix.cell_matrix.map do |row|
      row.map do |cell|
        apply_cell_rules(cell)
      end
    end
    Matrix.new(result)
  end

  def self.apply_cell_rules(matrix, cell)
    neighbor_count = matrix.neighbor_count(cell)
    new_cell = Cell.new(cell.alive?)

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