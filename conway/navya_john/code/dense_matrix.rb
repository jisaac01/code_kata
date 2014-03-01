class DenseMatrix

  attr_reader :height, :width

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = []

    (0...@width).each do
      @matrix << Array.new(@height)
    end
  end

  def count
    height * width
  end

  def get(x, y)
    @matrix[x][y]
  end

  def set(x, y, value)
    @matrix[x][y] = value
  end

  def each_value
    x = 0
    y = 0
    @matrix.each do |row|
      row.each do |value|
        yield x, y, value
        x += 1
      end
      y += 1
      x = 0
    end
  end

end
