def build_hash
  lowerletters = ('a'..'z').to_a
  upperletters = ('A'..'Z').to_a 
  hash = Hash.new
  lowerletters.each do |letter|
    hash[letter] = letter.ord
  end

  upperletters.each do |letter|
    hash[letter] = letter.ord
  end
  hash
end

def ceasar_cipher(sentence, step)
  hashLetters = build_hash
  hash_string = ''
  for i in sentence.split('')
    if hashLetters.has_key?(i)
      if hashLetters[i] + step > 122 and hashLetters[i] >= 97
        numberHash = (hashLetters[i] + step - 123)
        hash_string += hashLetters.key(numberHash + 97)
      elsif hashLetters[i] + step > 90 and hashLetters[i] >= 65 and hashLetters[i] <= 90
        numberHash = (hashLetters[i] + step) - 91
        hash_string += hashLetters.key(numberHash + 65)
      else
        hash_string += hashLetters.key(hashLetters[i]+step)
      end 
    else
      hash_string+=i
    end
  end
  hash_string
end
p ceasar_cipher("", 5)
