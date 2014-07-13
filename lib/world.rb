class RPG::World
  attr_accessor :blocks, :rpg

  def initialize(rpg)
    @rpg = rpg
    @blocks = []

    (rpg.window.width + 1).times do
      col = []

      (rpg.window.height + 1).times do
        col << rand(256)
      end

      @blocks << col
    end
  end

  def draw
    (0..rpg.window.width).each_with_index do |x|
      (0..rpg.window.height).each_with_index do |y|
        rpg.tiles[blocks[x][y]].draw(x * 16, y * 16, 1)
      end
    end
  end
end
