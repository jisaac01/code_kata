require_relative 'game_of_life'

class World

  attr_reader :simple_state

  def initialize(seed_matrix)
    @simple_state = seed_matrix
  end

  def self.run
    initial_state = [[0,0,0,0,0],[0,0,0,0,0],[0,1,1,1,0],[0,0,0,0,0],[0,0,0,0,0]]
    gol = GameOfLife.new(initial_state)
    gol.run
  end

end

World.run