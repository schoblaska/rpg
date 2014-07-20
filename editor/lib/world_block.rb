class RPG::WorldBlock
  attr_accessor :x, :y, :z, :material, :world, :tile

  def initialize(world, x, y, z, material)
    @x, @y, @z = x, y, z
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

  def draw(draw_x, draw_y, draw_z)
    tile.draw(draw_x, draw_y, draw_z)
  end
end
