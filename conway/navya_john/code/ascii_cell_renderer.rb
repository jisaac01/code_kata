class AsciiCellRenderer

  def render(cell, render_context)
    render_context.print(cell.alive? ? '*' : ' ')
  end

end
