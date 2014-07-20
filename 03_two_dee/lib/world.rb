class RPG::World
  COLS = 100
  ROWS = 100

  def initialize
    @blocks = Hash.new{|h, k| h[k] = {}}

    (0..COLS).each do |x|
      (0..ROWS).each do |y|
        @blocks[x][y] = RPG::WorldBlock.new([:grass, :grass, :grass, :water, :mud].sample)
      end
    end
  end

  def set_block(x, y, material)
    @blocks[x][y] = RPG::WorldBlock.new(material)
  end

  def draw(window)
    (window.left..window.right).each_with_index do |x, xi|
      (window.top..window.bottom).each_with_index do |y, yi|
        @blocks[x][y].draw(xi * 16, yi * 16)
      end
    end
  end
end
