module Enumerable
  def my_each
    return self unless block_given?
    if self.class == Hash 
      for elem in self.keys
        yield elem
      end
    else 
      for elem in self
        yield elem
      end
    end 
    self
  end

  def my_each_with_index
    return self unless block_given?
    i = 0
    for elem in self
      yield(elem, i)
      i+= 1
    end 
    self
  end

  def my_select
    arr = []
    self.my_each {|x| arr << x if yield(x)}
    arr
  end

  def my_all?
    answer = true
    self.my_each do |x|
      if yield(x) == false
        answer = false
        break
      end 
    end
    answer
  end

  def my_any?
    answer = true
    self.my_each do |x|
      if yield(x) == true
        answer = true
        break
      end
      answer = false
    end
    answer
  end

  def my_none?
    answer = true
    self.my_each do |x|
      if yield(x) == true
        answer = false
        break
      end
    end
    answer 
  end
  
  def my_count(arg=nil)
    count = [] 
    if arg != nil
      self.my_each{|x| count << x if x == arg}
    elsif block_given?
      self.my_each{|x| count << x if yield(x)}
    end
    count.length
  end

  def my_map
    return self.to_enum unless block_given?
    newArray = []
    self.my_each{|x| newArray << yield(x)}
    newArray
  end
end


#nums = [3,2,1,8,9,9,5,4]
# letter = ["iam", "goan", "dgdhj", "dyhddn", "dhgdgdh"]

#nums.my_each {|n| puts n}
#nums.my_each_with_index {|x, y| puts x, y}
#
# puts nums.my_select {|x| x < 4}
# puts letter.my_all? {|num| num.length >= 3}
# p %w{ajn b ct}.my_any? {|word| word.length >= 3} 
# p %w{ant bear catjj}.my_none? {|word| word.length == 5}
 ary = [1, 2, 4, 2]
# p ary.my_count { |x| x%2 == 0 }

# p ary.my_count(4)
#
#
p ary.map
