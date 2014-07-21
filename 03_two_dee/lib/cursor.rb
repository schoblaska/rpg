class RPG::Cursor
  attr_accessor :material

  def initialize
    @material = nil
  end

  def draw(window)
    x = (world_x(window) - window.worldview_left) * 16 + window.worldview.x
    y = (world_y(window) - window.worldview_top) * 16 + window.worldview.y

    tile.draw(x, y, 100, 1, 1, 0xccffffff)
  end

  def tile
    case material
    when nil
      TILES[:misc][0]
    when :grass
      TILES[:materials][0]
    when :mud
      TILES[:materials][100]
    when :water
      TILES[:materials][40]
    end
  end

  def world_x(window)
    ((window.worldview_left * 16 + window.mouse_x - window.worldview.x) / 16).to_i
  end

  def world_y(window)
    ((window.worldview_top * 16 + window.mouse_y - window.worldview.y) / 16).to_i
  end
end
