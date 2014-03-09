class Cell

  def initialize(alive)
    @alive = alive
  end

  def alive?
    @alive == 1
  end

  def kill
    @alive = false
  end

end
