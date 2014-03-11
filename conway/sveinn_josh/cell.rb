class Cell

  def initialize(alive)
    @alive = (alive == 1 || alive == true)
  end

  def alive?
    @alive == true
  end

  def kill
    @alive = false
  end

  def revive
    @alive = true
  end

end
