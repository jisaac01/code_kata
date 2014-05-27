class AsciiDrawer

  def draw(cell_matrix)
    print '-' * cell_matrix.length
    print "\n"
    cell_matrix.each do |row|
      print '|'
      row.each do |cell|
        print cell.alive? ? '*' : ' '
      end
      print "|\n"
    end
    print '-' * cell_matrix.length
    print "\n"
  end

end