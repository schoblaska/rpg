class RPG::PC
  attr_accessor :rpg, :x, :y

  def initialize(rpg)
    @rpg = rpg
    @x = rpg.cols / 2
    @y = rpg.rows / 2
  end

  def draw
    @rpg.tiles[14].draw(@x * 16, @y * 16, 2, 1, 1, 0xffff0000)
  end
end
