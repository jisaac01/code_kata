require_relative '../code/ascii_cell_renderer'
require 'test/unit'
require 'mocha/test_unit'


class AsciiCellRendererTest < Test::Unit::TestCase

  def setup
    @mock_render_context = mock('render_context')
    @mock_cell = mock('cell')
    @renderer = AsciiCellRenderer.new
  end

  def test_render__dead_cell_as_empty
    @mock_cell.expects(:alive?).returns(false)
    @mock_render_context.expects(:print).with(' ')
    @renderer.render(@mock_cell, @mock_render_context)
  end

  def test_render__alive_cell_as_star
    @mock_cell.expects(:alive?).returns(true)
    @mock_render_context.expects(:print).with('*')
    @renderer.render(@mock_cell, @mock_render_context)
  end

end
