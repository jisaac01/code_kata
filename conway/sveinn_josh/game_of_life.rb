require './matrix'
require './rule_master'

class GameOfLife
  ITERATIONS = 100

  def initialize(game_conditions)
    @current_matrix = Matrix.new(game_conditions)
    @iterations = 0
  end

  def run
    while !game_over? do
      @current_matrix.draw
      puts "Calculating next state..."
      tick!
    end
  end

  private

  def game_over?
    @iterations == ITERATIONS
  end

  def tick!
    @iterations += 1
    @current_matrix = RuleMaster.apply_rules(@current_matrix)
  end
end