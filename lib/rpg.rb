require "bundler/setup"

Bundler.require

class RPG
  attr_accessor :tiles

  def initialize(window)
    @tiles = Gosu::Image.load_tiles(window, "assets/tiles.png", 16, 16, true)
  end
end
