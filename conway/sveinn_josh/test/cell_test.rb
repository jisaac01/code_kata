require 'test/unit'

require_relative '../cell'

class CellTest < Test::Unit::TestCase

  def test_alive__initilized_with_binaries
    alive_cell = Cell.new(1)
    assert alive_cell.alive?

    dead_cell = Cell.new(0)
    assert !dead_cell.alive?
  end

  def test_alive__initilized_with_cells
    alive_cell = Cell.new(1)
    new_cell = Cell.new(alive_cell)
    assert new_cell.alive?

    dead_cell = alive_cell.kill
    assert !alive_cell.alive?
    assert new_cell.alive?
    new_cell = Cell.new(dead_cell)
    assert !new_cell.alive?
  end

  def test_kill
    dead_cell = Cell.new(0)
    assert !dead_cell.alive?

    dead_cell.kill
    assert !dead_cell.alive?

    alive_cell = Cell.new(1)
    assert alive_cell.alive?

    alive_cell.kill
    assert !alive_cell.alive?
  end

  def test_revive
    dead_cell = Cell.new(0)
    assert !dead_cell.alive?

    dead_cell.revive
    assert dead_cell.alive?

    alive_cell = Cell.new(1)
    assert alive_cell.alive?

    alive_cell.revive
    assert alive_cell.alive?
  end
end