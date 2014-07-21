class RPG::Cursor
  attr_accessor :material

  def initialize
    @material = nil
  end

  def draw(window)
    x = (mouse_tile_x(window) - window.left) * 16
    y = (mouse_tile_y(window) - window.top) * 16

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

  def mouse_tile_x(window)
    ((window.left * 16 + window.mouse_x) / 16).to_i
  end

  def mouse_tile_y(window)
    ((window.top * 16 + window.mouse_y) / 16).to_i
  end
end
