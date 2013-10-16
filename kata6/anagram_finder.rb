class AnagramFinder
  attr_reader :wordlist
 
  def initialize(wordlist)
    @wordlist = wordlist
  end

  def anagram_sets
    dictionary.select {|_, anagrams| anagrams.length > 1 }.map {|_, anagrams| anagrams }
  end

  private

  def dictionary
    wordlist.each_with_object(Hash.new([])) do |word, dictionary|
      dictionary[dict_key(word)] += [word]
    end
  end

  def dict_key(word)
    word.chars.sort.join
  end
end

if __FILE__ == $0
  puts AnagramFinder.new(File.readlines(ARGV[0])).anagram_sets.count
end

