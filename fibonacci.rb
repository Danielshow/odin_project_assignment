def fibonacci(num)
  answer = [1, 1]
  while answer.length < num
    answer << answer[answer.length - 1] + answer[answer.length - 2]
  end
  answer[-1]
end

p fibonacci(10)

def fibonacci_recur(num)
  num < 2 ? num : fibonacci_recur(num - 1) + fibonacci_recur(num - 2)
end

p fibonacci_recur(10)
