require_relative '../code/ascii_matrix_renderer'
require 'test/unit'

class AsciiMatrixRendererTest < Test::Unit::TestCase

  def setup
    @mock_value_renderer = mock('value renderer')
    @matrix_renderer = AsciiMatrixRenderer.new(@mock_value_renderer)
    @mock_matrix = mock('matrix')
    @mock_render_context = mock('render context')
  end

  def test_render
    @mock_matrix.stubs(:width).returns(2)
    @mock_matrix.stubs(:height).returns(2)

    values = [[0, 0, 'a'], [1, 0, 'b'], [0, 1, 'c'], [1, 1, 'd']]
    @mock_matrix.expects(:each_value).multiple_yields(*values)

    value_sequence = sequence('value_sequence')
    values.each do |value|
      @mock_value_renderer.expects(:render).with(value[2], @mock_render_context).in_sequence(value_sequence)
    end
    @mock_render_context.expects(:print).with("\n").times(2)
    @matrix_renderer.render(@mock_matrix, @mock_render_context)
  end

end
