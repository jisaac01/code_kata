require_relative '../code/random_cell_factory'
require 'test/unit'


class RandomCellFactoryTest < Test::Unit::TestCase
  def test_create
    expected_alive_fraction = 0.3

    alive_count = 0
    cell_factory = RandomCellFactory.new(expected_alive_fraction)
    100.times do
      cell = cell_factory.create_cell
      alive_count += 1 if cell.alive?
    end

    alive_fraction = alive_count.to_f / 100.0
    assert_in_delta(expected_alive_fraction, alive_fraction, 0.1)
  end
end
