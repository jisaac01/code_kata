class AsciiMatrixRenderer

  def initialize(value_renderer)
    @value_renderer = value_renderer
  end

  def render(matrix, render_context)
    matrix.each_value do |x, y, value|
      @value_renderer.render(value, render_context)
      render_context.print("\n") if x == (matrix.width - 1)
    end
  end
end