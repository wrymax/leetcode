# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}

def ladder_length(begin_word, end_word, word_list)
  visited = []
  # queue for BFS
  queue = [begin_word]

  # Stack for path
  transformation_steps = []

  queue_len = queue.length
  pending_words_len = 0
  steps = 1

  current_step_words = []
  while !queue.empty? do
    word = queue.pop
    puts "Word: #{word}; Step: #{steps}+#{pending_words_len}"
    queue_len -= 1
    step_words = []

    range = 'a'..'z'
    
    range.each do |letter|
      (0..word.length-1).each do |i|
        new_word = word.clone
        new_word[i] = letter

        if new_word == end_word && word_list.include?(new_word)
          transformation_steps += current_step_words
          transformation_steps.push new_word

          steps += current_step_words.length
          puts "Word: #{new_word}; Step: #{steps}"
          puts "transformation: #{transformation_steps.join(' -> ')}"
          return steps
        end

        if !visited.include?(new_word) && word_list.include?(new_word)
          # puts "-- #{new_word}"
          visited.push(new_word)
          queue.push(new_word)
          step_words.push(new_word)
          pending_words_len += 1
        end
      end
    end
    puts "-- word: #{word}, step_words: #{step_words}"

    # 1. Whenever BFS meets siblings, it will choose one branch to go
    # 2. Only when queue_len == 0, all siblings are cleared and is going deep into next branch
    # 3. the algorithm will stop half way and return steps + 1 when meets the final target
    # 4. when a set of siblings are cleared and go deep into the final sibling
    #     1) steps + 1
    #     2) set queue_len = pending_words_len as the real queue length
    #     3) clear pending_words_len
    if queue_len == 0
      queue_len = pending_words_len
      steps += 1
      pending_words_len = 0
      current_step_words = step_words
      step_words = []
      transformation_steps.push(word)
    else
    end
  end

  return 0
end

# Test

def test_ladder_length(params)
  puts "--------------------------"
  len = ladder_length(params[:begin_word], params[:end_word], params[:word_list])

  if len == params[:length]
    # "hit" -> "hot" -> "dot" -> "dog" -> "cog"
    puts "+ ladder_length works!"
  else
    puts "- ladder_length failed."
  end
end

data = [
  {
    begin_word: 'hit', 
    end_word: 'cog', 
    word_list: ["hot","dot","dog","lot","log","cog"], 
    length: 5
  }, 
  {
    begin_word: 'hit', 
    end_word: 'cog', 
    word_list: ["hot","dot","dog","lot","log"], 
    length: 0
  }, 
  {
    begin_word: 'a', 
    end_word: 'c', 
    word_list: ["a","b","c"], 
    length: 2
  }
]

data.each do |d|
  test_ladder_length(d)
end
