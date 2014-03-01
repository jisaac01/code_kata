require_relative 'cell'


class RandomCellFactory
  def initialize(fraction_alive)
    @fraction_alive = fraction_alive
  end

  def create_cell
    (rand < @fraction_alive) ? Cell::ALIVE_CELL : Cell::DEAD_CELL
  end
end
