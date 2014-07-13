require "bundler/setup"

Bundler.require

class RPG
  attr_accessor :window, :tiles, :world

  def initialize(window)
    @window = window
    @tiles = Gosu::Image.load_tiles(window, "assets/tiles.png", 16, 16, true)
    @world = RPG::World.new(self)
  end

  def rows
    window.height / 16
  end

  def cols
    window.width / 16
  end
end

require "./lib/world"
