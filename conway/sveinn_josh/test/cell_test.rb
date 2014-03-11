require 'test/unit'

require '../cell'

class CellTest < Test::Unit::TestCase

  def test_alive?
    alive_cell = Cell.new(1)
    assert alive_cell.alive?

    dead_cell = Cell.new(0)
    assert !dead_cell.alive?
  end

  def test_kill
    alive_cell = Cell.new(1)
    assert alive_cell.alive?

    alive_cell.kill
    assert !alive_cell.alive?
  end

end