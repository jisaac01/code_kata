require 'gosu'
require_relative 'z_order'

class GosuDrawer
  def draw(cell_matrix)

    $conway.font.draw(' ' + '-' * cell_matrix.length, 10, 10, ZOrder::UI, 1.0, 1.0, 0xffffff00)
    cell_matrix.each_with_index do |row, i|
      text = '|'
      row.each do |cell|
        text << (cell.alive? ? '*' : ' ')
      end
      text << '|'
      $conway.font.draw(text, 10, (10 * (i + 2)) , ZOrder::UI, 1.0, 1.0, 0xffffff00)
    end
    $conway.font.draw(' ' + '-' * cell_matrix.length, 10, (10 * (cell_matrix.length + 2)), ZOrder::UI, 1.0, 1.0, 0xffffff00)

  end
end


