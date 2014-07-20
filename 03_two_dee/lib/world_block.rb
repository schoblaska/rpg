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

  def mist_tile
    world.rpg.tiles[:misc][126]
  end

  def draw_mist(draw_x, draw_y, height_diff)

    if height_diff > 0
      alpha = (height_diff.abs.restrict(0, 4) * 63).to_s(16)
      mist_tile.draw(draw_x, draw_y, 2, 1, 1, "0x#{alpha}ffffff".hex)
    elsif height_diff < 0
      alpha = (height_diff.abs.restrict(0, 4) * 20).to_s(16)
      mist_tile.draw(draw_x, draw_y, 2, 1, 1, "0x#{alpha}000000".hex)
    end
  end

  def draw(draw_x, draw_y)
    tile.draw(draw_x, draw_y, 1)
    draw_mist(draw_x, draw_y, z - (world.rpg.player.z - 1))
  end
end
