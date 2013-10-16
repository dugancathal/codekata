require 'minitest/autorun'
require 'minitest/pride'

require_relative 'anagram_finder'

class AnagramFinderTest < Minitest::Test
  def test_can_identify_an_anagram_set
    finder = AnagramFinder.new(%w(actaeonidae donatiaceae))
    assert_equal [%w(actaeonidae donatiaceae)], finder.anagram_sets
  end

  def test_throws_out_words_that_arent_in_an_anagram_set
    finder = AnagramFinder.new(%w(actaeonidae donatiaceae word))
    assert_equal [%w(actaeonidae donatiaceae)], finder.anagram_sets
  end

  def test_may_return_multiple_sets_of_acronyms
    finder = AnagramFinder.new(%w(actaeonidae rots donatiaceae sort))
    assert_equal [%w(actaeonidae donatiaceae), %w(rots sort)], finder.anagram_sets
  end
end
