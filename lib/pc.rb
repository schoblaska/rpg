class RPG::PC
  attr_accessor :rpg, :x, :y, :moved

  def initialize(rpg)
    @rpg = rpg
    @x = rpg.cols / 2
    @y = rpg.rows / 2
    @moved = Time.now
  end

  def draw
    @rpg.tiles[14].draw(@x * 16, @y * 16, 2, 1, 1, 0xffff0000)
  end

  def update
    if can_move?
      move(:left)  if @rpg.window.button_down?(Gosu::Button::KbLeft)
      move(:right) if @rpg.window.button_down?(Gosu::Button::KbRight)
      move(:up)    if @rpg.window.button_down?(Gosu::Button::KbUp)
      move(:down)  if @rpg.window.button_down?(Gosu::Button::KbDown)
    end
  end

  def can_move?
    (Time.now.to_f - @moved.to_f) * 1000.0 > 50
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
