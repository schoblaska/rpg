class RPG::WorldBlock
  attr_accessor :x, :y, :material, :world, :tile

  def initialize(world, x, y, material)
    @x, @y = x, y
    @material = material
    @world = world

    case material
    when :grass
      @tile = world.rpg.tiles[:materials][rand(20)]
    when :water
      @tile = world.rpg.tiles[:materials][40 + rand(3)]
    when :mud
      @tile = world.rpg.tiles[:materials][100 + rand(6)]
    end
  end

  def draw(draw_x, draw_y)
    tile.draw(draw_x, draw_y, 1)
  end
end
