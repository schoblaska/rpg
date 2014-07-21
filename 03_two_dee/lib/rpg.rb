require "bundler/setup"

Bundler.require

class RPG
  attr_accessor :world, :player

  def initialize
    @world = RPG::World.new
    @player = RPG::PC.new
  end

  def draw(window)
    @world.draw(window)
    @player.draw(window)
  end

  def update(window)
    @player.update(window)
  end
end

require "./lib/core_ext/numeric"

require "./lib/cursor"
require "./lib/pc"
require "./lib/world"
require "./lib/world_block"
