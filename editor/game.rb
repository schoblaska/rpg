require "./lib/rpg"

class GameWindow < Gosu::Window
  attr_accessor :rpg

  def initialize
    super(1024, 576, false)
    self.caption = "Editor"

    @rpg = RPG.new(self)
  end

  def draw
    rpg.draw
  end

  def update
    rpg.update
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  def top
    rpg.player.y - rpg.window.height / 16 / 2
  end

  def bottom
    rpg.player.y + rpg.window.height / 16 / 2
  end

  def left
    rpg.player.x - rpg.window.width / 16 / 2
  end

  def right
    rpg.player.x + rpg.window.width / 16 / 2
  end
end

GameWindow.new.show
