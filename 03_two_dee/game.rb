require "./lib/rpg"

class GameWindow < Gosu::Window
  attr_accessor :worldview

  def initialize
    super(16 * 75, 16 * 42, false)

    self.caption = "Editor"

    @rpg = RPG.new
    @cursor = RPG::Cursor.new
    @worldview = RPG::Viewport.new(16 * 10, 0, 16 * 65, 16 * 35)
  end

  def draw
    @rpg.draw(self)
    @cursor.draw(self)
  end

  def update
    @rpg.update(self)

    if button_down?(Gosu::MsLeft)
      @rpg.world.set_block(@cursor.world_x(self), @cursor.world_y(self), @cursor.material)
    end
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
    end
  end

  def worldview_top;    worldview.top(@rpg.player);    end
  def worldview_right;  worldview.right(@rpg.player);  end
  def worldview_bottom; worldview.bottom(@rpg.player); end
  def worldview_left;   worldview.left(@rpg.player);   end
end

window = GameWindow.new

TILES = {
  :misc => Gosu::Image.load_tiles(window, "assets/misc.png", 16, 16, true),
  :materials => Gosu::Image.load_tiles(window, "assets/materials.png", 16, 16, true)
}

window.show
