class Cell

  def initialize(alive)
    alive = alive.respond_to?(:alive?) ? alive.alive? : alive
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

  def to_s
    alive?.to_s
  end
end
