class Cell

  def initialize(is_alive = false)
    @alive = is_alive
  end

  def alive?
    @alive
  end

  def kill
    DEAD_CELL
  end

  def revive
    ALIVE_CELL
  end

  ALIVE_CELL = Cell.new(true)
  DEAD_CELL = Cell.new(false)

end
