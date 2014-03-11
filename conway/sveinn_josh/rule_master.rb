class RuleMaster

  def self.apply_rules(matrix)
    result = matrix.cell_matrix.map do |row|
      row.map do |cell|
        apply_cell_rules(cell)
      end
    end
    Matrix.new(result)
  end

  def self.apply_cell_rules(cell)

  end
end