require_relative '../code/cell'
require 'test/unit'

class CellTest < Test::Unit::TestCase

  def test_default_initialization
    assert_false Cell.new.alive?
  end

  def test_explicit_initialization
    assert_false Cell.new(false).alive?
    assert Cell.new(true).alive?
  end

  def test_cell_constants
    assert Cell::ALIVE_CELL.alive?
    assert_false Cell::DEAD_CELL.alive?
  end

  def test_kill
    cell = Cell.new(true)
    assert_false cell.kill.alive?
  end

  def test_revive
    cell = Cell.new(false)
    assert cell.revive.alive?
  end

end
