require "bundler/setup"

Bundler.require

class RPG
  attr_accessor :window, :tiles, :world, :player

  def initialize(window)
    @window = window
    @tiles = Gosu::Image.load_tiles(window, "assets/tiles.png", 16, 16, true)
    @world = RPG::World.new(self)
    @player = RPG::PC.new(self)
  end

  def rows
    window.height / 16
  end

  def cols
    window.width / 16
  end

  def draw
    @world.draw
    @player.draw
  end

  def update
    @player.update
  end
end

require "./lib/pc"
require "./lib/world"
