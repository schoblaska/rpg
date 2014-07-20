class RPG::World
  attr_accessor :blocks, :rpg

  def initialize(rpg)
    @rpg = rpg
    @blocks = []

    rpg.cols.times do
      col = []
      rpg.rows.times { col << rand(256) }
      @blocks << col
    end
  end

  def draw
    (0..(rpg.cols - 1)).each_with_index do |x|
      (0..(rpg.rows - 1)).each_with_index do |y|
        rpg.tiles[blocks[x][y]].draw(x * 16, y * 16, 1)
      end
    end
  end
end
