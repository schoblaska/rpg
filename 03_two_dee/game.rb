require "./lib/rpg"

class GameWindow < Gosu::Window

  def initialize
    super(16 * 64, 16 * 36, false)
    self.caption = "Editor"
    @rpg = RPG.new
    @cursor = RPG::Cursor.new
  end

  def draw
    @rpg.draw(self)
    @cursor.draw(self)
  end

  def update
    @rpg.update(self)
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      close
    when Gosu::KbW
      @cursor.material = :water
    when Gosu::KbG
      @cursor.material = :grass
    when Gosu::KbM
      @cursor.material = :mud
    when Gosu::MsLeft
      @rpg.world.set_block(@cursor.mouse_tile_x(self), @cursor.mouse_tile_y(self), @cursor.material)
    end
  end

  def top
    min_top = 0
    max_top = RPG::World::ROWS - height / 16

    (@rpg.player.y - height / 16 / 2).restrict(min_top, max_top)
  end

  def bottom
    min_bottom = height / 16
    max_bottom = RPG::World::ROWS - 1

    (@rpg.player.y + height / 16 / 2).restrict(min_bottom, max_bottom)
  end

  def left
    min_left = 0
    max_left = RPG::World::COLS - width / 16

    (@rpg.player.x - width / 16 / 2).restrict(min_left, max_left)
  end

  def right
    min_right = width / 16
    max_right = RPG::World::COLS - 1

    (@rpg.player.x + width / 16 / 2).restrict(min_right, max_right)
  end
end

window = GameWindow.new

TILES = {
  :misc => Gosu::Image.load_tiles(window, "assets/misc.png", 16, 16, true),
  :materials => Gosu::Image.load_tiles(window, "assets/materials.png", 16, 16, true)
}

window.show
