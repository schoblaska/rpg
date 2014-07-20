require "./lib/rpg"

class GameWindow < Gosu::Window
  attr_accessor :rpg, :cursor

  def initialize
    super(16 * 64, 16 * 36, false)
    self.caption = "Editor"

    @rpg = RPG.new(self)
    @cursor = @rpg.tiles[:misc][92]
  end

  def draw
    rpg.draw
    cursor.draw(mouse_x, mouse_y, 100, 1, 1, 0xffffff00)
  end

  def update
    rpg.update
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  def top
    min_top = 0
    max_top = rpg.world.rows - height / 16

    (rpg.player.y - height / 16 / 2).restrict(min_top, max_top)
  end

  def bottom
    min_bottom = height / 16
    max_bottom = rpg.world.rows - 1

    (rpg.player.y + height / 16 / 2).restrict(min_bottom, max_bottom)
  end

  def left
    min_left = 0
    max_left = rpg.world.cols - width / 16

    (rpg.player.x - width / 16 / 2).restrict(min_left, max_left)
  end

  def right
    min_right = width / 16
    max_right = rpg.world.cols - 1

    (rpg.player.x + width / 16 / 2).restrict(min_right, max_right)
  end
end

GameWindow.new.show
