def build_hash
  letters = ('a'..'z').to_a 
  hash = Hash.new
  letters.each do |letter|
    hash[letter] = letter.ord
  end
  hash
end

p build_hash
