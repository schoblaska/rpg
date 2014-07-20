class RPG::World
  attr_accessor :blocks, :rpg

  def initialize(rpg)
    @rpg = rpg
    @blocks = []

    cols.times do
      col = []
      rows.times { col << rand(256) }
      @blocks << col
    end
  end

  def cols
    100
  end

  def rows
    100
  end

  def draw
    (rpg.window.left..rpg.window.right).each_with_index do |x, xi|
      (rpg.window.top..rpg.window.bottom).each_with_index do |y, yi|
        rpg.tiles[blocks[x][y]].draw(xi * 16, yi * 16, 1)
      end
    end
  end
end
