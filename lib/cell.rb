class Cell
  def initialize
    @hit = false
  end

  def hit?
    @hit
  end

  def strike
    @hit = true
  end

  def to_s
    if hit?
      "X"
    else
      "."
    end
  end
end
