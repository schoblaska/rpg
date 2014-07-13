require "./lib/rpg"

class GameWindow < Gosu::Window
  def initialize
   super(1024, 576, false)
   self.caption = 'Hello World!'
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

GameWindow.new.show
