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
    # your code here
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
