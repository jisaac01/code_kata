require_relative 'game_of_life'

class World

  DEFAULT_STARTING_CONFIG = [[0,0,0,0,0],[0,0,0,0,0],[0,1,1,1,0],[0,0,0,0,0],[0,0,0,0,0]]
  attr_reader :simple_state

  def self.run(args = nil)
    initial_state = args || DEFAULT_STARTING_CONFIG
    gol = GameOfLife.new(initial_state)
    gol.run
  end

end

arrays = (ARGV[0] || "").scan(/\[[\d\,]+\]/).map(&:to_s)
integer_array = arrays.map { |a| a.scan(/\d/).map(&:to_i) }
World.run integer_array