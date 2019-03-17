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

  def my_inject(arg=nil)
    return self.to_enum unless block_given?
    answer = nil
    if arg != nil 
      answer = arg
      self.my_each {|n| answer = yield(answer, n)}
    else 
      answer = self.to_a[0]
      self.my_each_with_index {|n, index| answer = yield(answer, self.to_a[index+1]) if index+1 < self.to_a.length}
    end
    answer
  end 
end

# a method that use my created inject
def multiply_els arr
  arr.my_inject(1) {|product, n| product * n}
end 

p multiply_els([2,4,5])

p (5..10).my_inject(10) {|sum, n| sum - n }            #=> 45
p (5..10).my_inject(10) {|product, n| product * n }
#nums = [3,2,1,8,9,9,5,4]
longest = %w{ cat sheep bear }.my_inject do |memo,word|
   memo.length > word.length ? memo : word
end
p longest                                       #=> "sheep"
# letter = ["iam", "goan", "dgdhj", "dyhddn", "dhgdgdh"]

#nums.my_each {|n| puts n}
#nums.my_each_with_index {|x, y| puts x, y}
#
# puts nums.my_select {|x| x < 4}
# puts letter.my_all? {|num| num.length >= 3}
# p %w{ajn b ct}.my_any? {|word| word.length >= 3} 
# p %w{ant bear catjj}.my_none? {|word| word.length == 5}
 # ary = [1, 2, 4, 2]
# p arymy_count { |x| x%2 == 0 }

# p ary.my_count(4)
#
#
# p ary.map


