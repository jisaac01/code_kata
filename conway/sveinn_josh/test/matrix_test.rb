require 'test/unit'
require 'stringio'

require_relative '../matrix'

class MatrixTest < Test::Unit::TestCase

  def test_initialize__with_arrays
    seed_matrix = [[0,1,0], [0,0,0], [0,0,1]]
    matrix = Matrix.new(seed_matrix)

    assert_equal seed_matrix, matrix.instance_variable_get(:@seed_matrix)

    actual_cell_matrix = matrix.cell_matrix
    actual_cell_matrix.each do |row|
      row.each {|cell| assert cell.is_a?(Cell)}
    end

    expected_alive_matrix = [[false,true,false], [false,false,false], [false,false,true]]

    actual_alive_matrix = actual_cell_matrix.map do |row|
      row.map {|cell| cell.alive?}
    end

    assert_equal expected_alive_matrix, actual_alive_matrix
  end

  def test_neighbor_count
    seed_matrix = [[0,1,0],
                   [0,0,0],
                   [0,0,1]]
    matrix = Matrix.new(seed_matrix)
    assert_equal 1, matrix.neighbor_count(0,0)
    assert_equal 0, matrix.neighbor_count(0,1)
    assert_equal 2, matrix.neighbor_count(1,1)
  end

  def test_neighbor_count__boundaries
    seed_matrix = [[1,1,1],
                   [1,1,1],
                   [1,1,1]]
    matrix = Matrix.new(seed_matrix)
    assert_equal 3, matrix.neighbor_count(0,0)
    assert_equal 5, matrix.neighbor_count(0,1)
    assert_equal 3, matrix.neighbor_count(0,2)

    assert_equal 5, matrix.neighbor_count(1,0)
    assert_equal 8, matrix.neighbor_count(1,1)
    assert_equal 5, matrix.neighbor_count(1,2)

    assert_equal 3, matrix.neighbor_count(2,0)
    assert_equal 5, matrix.neighbor_count(2,1)
    assert_equal 3, matrix.neighbor_count(2,2)
  end

  def test_cell_exists
    seed_matrix1 = [[0,1,0], [0,0,0], [0,0,1]]
    matrix1 = Matrix.new(seed_matrix1)

    assert matrix1.send(:cell_exists?,0,0)

    assert !matrix1.send(:cell_exists?,0,10)
  end

  def test_cell_alive
    seed_matrix1 = [[0,1,0], [0,0,0], [0,0,1]]
    matrix1 = Matrix.new(seed_matrix1)

    assert !matrix1.send(:cell_alive?,0,0)

    assert !matrix1.send(:cell_alive?,0,10)

    assert matrix1.send(:cell_alive?,0,1)
  end

  def test_equals
    seed_matrix1 = [[0,1,0], [0,0,0], [0,0,1]]
    matrix1 = Matrix.new(seed_matrix1)

    seed_matrix2 = [[0,1,0], [0,0,0], [0,0,1]]
    matrix2 = Matrix.new(seed_matrix2)

    assert matrix1 == matrix2, "matrixes are not equal!"

    seed_matrix3 = [[0,1,0], [0,0,1], [0,0,1]]
    matrix3 = Matrix.new(seed_matrix3)
    assert matrix1 != matrix3, "matrixes are equal!"

    seed_matrix4 = [[0,1,0], [0,0,0, 1], [0,0,1]]
    matrix4 = Matrix.new(seed_matrix4)
    assert matrix1 != matrix4, "matrixes are equal!"
  end


end