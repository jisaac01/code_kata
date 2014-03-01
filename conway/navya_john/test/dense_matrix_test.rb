require_relative '../code/dense_matrix'
require 'test/unit'

class DenseMatrixTest < Test::Unit::TestCase

  def setup
    @matrix = DenseMatrix.new(2, 2)
    @matrix.set(0, 0, 0)
    @matrix.set(0, 1, 1)
    @matrix.set(1, 0, 2)
    @matrix.set(1, 1, 3)
  end

  def test_initialize
    DenseMatrix.new(2, 2).each_value do |x, y, value|
      assert_nil value
    end
  end

  def test_count
    matrix = DenseMatrix.new(20, 42)
    assert_equal (20 * 42), matrix.count
  end

  def test_get_and_set_value
    assert_equal 1, @matrix.get(0, 1)
    @matrix.set(0, 1, 'some value')
    assert_equal 'some value', @matrix.get(0, 1)
  end

  def test_each_value
    expected_x = 0
    expected_y = 0
    expected_value = 0
    @matrix.each_value do |x, y, value|
      assert_equal expected_x, x
      assert_equal expected_y, y
      assert_equal expected_value, value
      expected_value += 1
      expected_x = expected_value % @matrix.width
      expected_y = expected_value / @matrix.width
    end
  end

  def test_dimensions
    matrix = DenseMatrix.new(2, 4)
    assert_equal 2, matrix.width
    assert_equal 4, matrix.height
  end

end