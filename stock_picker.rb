def stock_picker(stock)
  minmax = stock.minmax
  return [stock.index(minmax[0]), stock.index(minmax[1])] if stock.index(minmax[1]) > stock.index(minmax[0])
  profit = 0
  answerindex = []
  stock.combination(2).to_a.each do |key|
    if key.minmax == key and key[1] - key[0] > profit
      profit = key[1] - key[0]
      answerindex = [stock.index(key[0]), stock.index(key[1])]
    end 
  end 
  return answerindex
end


p stock_picker([17,3,6,9,15,8,6,1,10])
