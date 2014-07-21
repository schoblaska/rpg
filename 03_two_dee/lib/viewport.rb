class RPG::Viewport
  attr_accessor :x, :y, :width, :height

  def initialize(x, y, width, height)
    @x, @y, @width, @height = x, y, width, height
  end

  def top(player)
    min_top = 0
    max_top = RPG::World::ROWS - @height / 16

    (player.y - @height / 16 / 2).restrict(min_top, max_top)
  end

  def bottom(player)
    min_bottom = @height / 16 - 1
    max_bottom = RPG::World::ROWS - 1

    (top(player) + @height / 16 - 1).restrict(min_bottom, max_bottom)
  end

  def left(player)
    min_left = 0
    max_left = RPG::World::COLS - @width / 16

    (player.x - @width / 16 / 2).restrict(min_left, max_left)
  end

  def right(player)
    min_right = @width / 16 - 1
    max_right = RPG::World::COLS - 1

    (left(player) + @width / 16 - 1).restrict(min_right, max_right)
  end
end
