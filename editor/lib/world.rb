class RPG::World
  attr_accessor :blocks, :rpg

  def initialize(rpg)
    @rpg = rpg
    @blocks = Hash.new{|h, k| h[k] = {}}

    (0..cols).each do |x|
      (0..rows).each do |y|
        blocks[x][y] = RPG::WorldBlock.new(self, x, y, 1, :grass)
      end
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
        blocks[x][y].draw(xi * 16, yi * 16, 1)
      end
    end
  end
end
