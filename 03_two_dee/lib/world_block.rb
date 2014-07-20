class RPG::WorldBlock
  def initialize(material)
    @material = material
    @seed = rand(99)
  end

  def tile
    case @material
    when :grass
      TILES[:materials][@seed % 20]
    when :water
      TILES[:materials][40 + @seed % 3]
    when :mud
      TILES[:materials][100 + @seed % 6]
    end
  end

  def draw(draw_x, draw_y)
    tile.draw(draw_x, draw_y, 1)
  end
end
