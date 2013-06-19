require 'minitest/autorun'
require File.expand_path('../chop.rb', __FILE__)

class ChopTest < Minitest::Test
  def test_not_found_chop
    assert_equal(-1, chop(3, []))
    assert_equal(-1, chop(3, [1]))

    assert_equal(-1, chop(0, [1, 3, 5]))
    assert_equal(-1, chop(2, [1, 3, 5]))
    assert_equal(-1, chop(4, [1, 3, 5]))
    assert_equal(-1, chop(6, [1, 3, 5]))

    assert_equal(-1, chop(0, [1, 3, 5, 7]))
    assert_equal(-1, chop(2, [1, 3, 5, 7]))
    assert_equal(-1, chop(4, [1, 3, 5, 7]))
    assert_equal(-1, chop(6, [1, 3, 5, 7]))
    assert_equal(-1, chop(8, [1, 3, 5, 7]))
    assert_equal(0,  chop(1, [1]))
  end

  # def test_found_chop
    # assert_equal(0,  chop(1, [1, 3, 5]))
    # assert_equal(1,  chop(3, [1, 3, 5]))
    # assert_equal(2,  chop(5, [1, 3, 5]))

    # assert_equal(0,  chop(1, [1, 3, 5, 7]))
    # assert_equal(1,  chop(3, [1, 3, 5, 7]))
    # assert_equal(2,  chop(5, [1, 3, 5, 7]))
    # assert_equal(3,  chop(7, [1, 3, 5, 7]))
  # end

  def test_midpoint
    assert_equal 0, midpoint([])
    assert_equal 0, midpoint([0])
    assert_equal 0, midpoint([2, 3])
    assert_equal 1, midpoint([3, 4, 5])
    assert_equal 1, midpoint([4, 5, 6, 7])
    assert_equal 2, midpoint([5, 6, 7, 8, 9])
  end
end
