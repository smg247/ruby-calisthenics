module FunWithStrings
  def palindrome?
    return self.sub_non_word_chars.reverse.upcase == self.sub_non_word_chars.upcase
  end
  
  def sub_non_word_chars
    return self.gsub(/\W|\d/, "")
  end

  def count_words
    count = {}
    words = tokenize
    words.each { |word|
      word.downcase!
      if count.has_key? word then
        count[word] = count[word] + 1
      else
        count[word] = 1
      end
    }
    
    return count
  end
  
  def tokenize
    return self.gsub(/\W/, ' ').split(" ")
  end
  
  def anagram_groups
    anagrams = []
    words = tokenize
    
    words.each_with_index { |word, index|
      matches = [word]
      rest = words[(index + 1)..-1]
      rest.each { |other_word|
        if anagram?(word, other_word) then
          matches.push(other_word)
        end
      }
      
      anagrams.push(matches)
    }
    
    return anagrams
  end
  
  def anagram?(word, other_word)
    return word.split("").sort == other_word.split("").sort
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
