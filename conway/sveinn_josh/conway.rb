require 'gosu'
require 'yaml'
require_relative 'game_of_life'

class Conway < Gosu::Window

  DEFAULT_STARTING_CONFIG = [[0,0,0,0,0],[0,0,0,0,0],[0,1,1,1,0],[0,0,0,0,0],[0,0,0,0,0]]
  attr_reader :font

  def initialize(args = nil)
    super 640, 480, false
    self.caption = "Conway's Game of Life"
    initial_state = args || DEFAULT_STARTING_CONFIG
    @gol = GameOfLife.new(initial_state)
    @font = Gosu::Font.new(self, 'Courier', 20)
  end

  def update
    @gol.tick!
  end

  def draw
    @gol.draw
  end
end

args = (ARGV[0] || "")
arrays = args.scan(/\[[\d\,]+\]/).map(&:to_s)
if !arrays.empty?
  integer_array = arrays.map { |a| a.scan(/\d/).map(&:to_i) }
else
  patterns = YAML.load_file('config/patterns.yml')
  integer_array = patterns[args]
end
$conway = Conway.new(integer_array)
$conway.show