require "./lib/rpg"

class GameWindow < Gosu::Window
  attr_accessor :rpg

  def initialize
    super(1024, 576, false)
    self.caption = 'Hello World!'

    @rpg = RPG.new(self)
  end

  def draw
    @rpg.draw
  end

  def update
    @rpg.update
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

GameWindow.new.show
