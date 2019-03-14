def substrings(word, dictionary)
  myword = Hash.new(0)
  dictionary.each do |i|
    if word.include? i
      myword[i] += word.downcase.scan(i).length
    end 
  end
  myword 
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("Howdy partner, sit down! How'ss it going?", dictionary)
p substrings("below", dictionary)
  #=> { "below" => 1, "low" => 1 }

