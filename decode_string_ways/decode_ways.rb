# @param {String} s
# @return {Integer}
def num_decodings(s)
  len = s.length
  dp = [1]
  chars = s.chars

  return 0 if chars[0] == '0'

  for i in (1..len) do
    puts "i = #{i}; chars[i-1] = #{chars[i-1]}; dp = #{dp.join(' ')}"

    if chars[i-1] == '0'
      dp[i] = 0
    else
      dp[i] = dp[i-1]
    end

    if i > 1 && chars[i-2] == '1' || chars[i-2] == '2' && chars[i-1].to_i <= 6
      dp[i] += dp[i-2]
    end

  end

  dp.pop
end

puts num_decodings('123021')
