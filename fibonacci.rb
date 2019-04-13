def fibonacci(num)
  answer = [1, 1]
  while answer[answer.length - 1] < num
    answer << answer[answer.length - 1] + answer[answer.length - 2]
  end
  answer[answer.length - 1] > num ? answer[0...answer.length - 1] : answer
end

p fibonacci(10)
