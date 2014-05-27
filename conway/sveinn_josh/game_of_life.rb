require_relative 'matrix'
require_relative 'rule_master'

class GameOfLife
  ITERATIONS = 100

  def initialize(game_conditions)
    @current_matrix = Matrix.new(game_conditions)
    @iterations = 0
    @last_update = Time.now
  end

  def tick!
    now = Time.now
    if(now - @last_update) >= 0.5 && !game_over?
      @last_update = now
      @iterations += 1
      @current_matrix = RuleMaster.apply_rules(@current_matrix)
    end
  end

  def draw
    @current_matrix.draw
  end

  private

  def game_over?
    @iterations == ITERATIONS
  end

end