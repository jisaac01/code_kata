require 'test/unit'
require 'stringio'

require_relative '../matrix'

class AsciiDrawerTest < Test::Unit::TestCase

  def test_draw
    seed_matrix = [[0,1,0],
                   [0,0,0],
                   [0,0,1]]
    matrix = Matrix.new(seed_matrix)

    printout = StringIO.new
    $stdout = printout

    AsciiDrawer.new.draw(matrix.cell_matrix)

    expected = "---\n| * |\n|   |\n|  *|\n---\n"

    assert_equal expected, printout.string
  end

end