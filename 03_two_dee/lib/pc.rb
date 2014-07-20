class RPG::PC
  attr_accessor :x, :y

  def initialize
    @x = RPG::World::COLS / 2
    @y = RPG::World::ROWS / 2
    @moved = Time.now
  end

  def draw(window)
    draw_x = @x - window.left
    draw_y = @y - window.top
    TILES[:misc][157].draw(draw_x * 16, draw_y * 16, 3, 1, 1, 0xffff0000)
  end

  def update(window)
    if can_move?
      move(:left)  if window.button_down?(Gosu::Button::KbLeft)
      move(:right) if window.button_down?(Gosu::Button::KbRight)
      move(:up)    if window.button_down?(Gosu::Button::KbUp)
      move(:down)  if window.button_down?(Gosu::Button::KbDown)
    end
  end

  def can_move?
    (Time.now.to_f - @moved.to_f) * 1000.0 > 75
  end

  def move(direction)
    case direction
    when :left  then @x -= 1
    when :right then @x += 1
    when :up    then @y -= 1
    when :down  then @y += 1
    end

    @moved = Time.now
  end
end
