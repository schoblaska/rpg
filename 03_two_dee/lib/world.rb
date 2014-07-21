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
    (window.worldview_left..window.worldview_right).each_with_index do |x, xi|
      (window.worldview_top..window.worldview_bottom).each_with_index do |y, yi|
        @blocks[x][y].draw(xi * 16 + window.worldview.x, yi * 16 + window.worldview.y)
      end
    end
  end
end
