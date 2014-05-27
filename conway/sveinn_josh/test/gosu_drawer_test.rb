require 'test/unit'
require 'mocha/setup'

require_relative '../matrix'
require_relative '../gosu_drawer'

class GosuDrawerTest < Test::Unit::TestCase

  def test_draw
    seed_matrix = [[0,1,0],
                   [0,0,0],
                   [0,0,1]]
    matrix = Matrix.new(seed_matrix)

    $conway = Gosu::Window.new(640, 480, false)

    font = Gosu::Font.new($conway, 'Courier', 20)
    $conway.stubs(:font).returns(font)
    font.expects(:draw).with(' ---', 10, 10, 3, 1.0, 1.0, 0xffffff00)
    font.expects(:draw).with('| * |', 10, 20, 3, 1.0, 1.0, 0xffffff00)
    font.expects(:draw).with('|   |', 10, 30, 3, 1.0, 1.0, 0xffffff00)
    font.expects(:draw).with('|  *|', 10, 40, 3, 1.0, 1.0, 0xffffff00)
    font.expects(:draw).with(' ---', 10, 50, 3, 1.0, 1.0, 0xffffff00)
    GosuDrawer.new.draw(matrix.cell_matrix)
  end

end