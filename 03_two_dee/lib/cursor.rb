class RPG::Cursor
  attr_accessor :material

  def initialize
    @material = nil
  end

  def draw(window)
    if in_worldview?(window)
      x = (world_x(window) - window.worldview_left) * 16 + window.worldview.x
      y = (world_y(window) - window.worldview_top) * 16 + window.worldview.y

      tile.draw(x, y, 100, 1, 1, 0xccffffff)
    end

    TILES[:cursor].draw(window.mouse_x, window.mouse_y, 101)
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

  def in_worldview?(window)
    window.mouse_x > window.worldview.x &&
      window.mouse_y > window.worldview.y &&
      window.mouse_x < window.worldview.x + window.worldview.width &&
      window.mouse_y < window.worldview.y + window.worldview.height
  end

  def world_x(window)
    ((window.worldview_left * 16 + window.mouse_x - window.worldview.x) / 16).to_i
  end

  def world_y(window)
    ((window.worldview_top * 16 + window.mouse_y - window.worldview.y) / 16).to_i
  end
end
