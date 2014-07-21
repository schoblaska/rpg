class RPG::Cursor
  attr_accessor :material

  def draw(window)
    x = (mouse_tile_x(window) - window.left) * 16
    y = (mouse_tile_y(window) - window.top) * 16

    TILES[:misc][12].draw(x, y, 100, 1, 1, 0xffffff00)
  end

  def mouse_tile_x(window)
    ((window.left * 16 + window.mouse_x) / 16).to_i
  end

  def mouse_tile_y(window)
    ((window.top * 16 + window.mouse_y) / 16).to_i
  end
end
