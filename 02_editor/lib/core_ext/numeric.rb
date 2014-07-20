class Numeric
  def restrict(min, max)
    self < min ? min : (self > max ? max : self)
  end
end
