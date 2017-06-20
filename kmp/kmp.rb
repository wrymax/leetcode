# KMP implementation
# Params:
#   @base: the base string, often longer than template.
#   @template: a template string. KMP is to find a match of template in Base string.
# Return:
#   index: Integer
def kmp(base, template)
  result = -1  
  match_table = make_match_table(template)

  base_len = base.length
  temp_len = template.length
  base_index = 0
  temp_index = 0

  while base_index < base_len && temp_index < temp_len do
    # puts "base: #{base_index}; temp: #{temp_index}"
    if base[base_index] == template[temp_index]
      if temp_index == temp_len - 1
        # puts "Success! base: #{base_index}, temp: #{temp_index}"
        return base_index - (temp_len - 1)
      else
        base_index += 1
        temp_index += 1
        # puts "base + 1; temp + 1"
      end
    else
      if temp_index == 0
        # base move rigttwards, template go back to first letter
        base_index += 1
        temp_index = 0
        # puts "base + 1; temp => 0"
      else
        # set current temp_index to match_table[temp_index-1], which is matched length of common string
        # puts "temp => match_table[temp_index]: #{match_table[temp_index-1]}"
        temp_index = match_table[temp_index-1]
      end
    end
  end

  return result
end

# The spirit of KMP: make match table for template string
def make_match_table(template)
  len = template.length
  table = []

  (1..len).each do |n|
    pre = prefixes(template, n)
    suf = suffixes(template, n)
    # puts "pre: #{pre.join(' ')}; suf: #{suf.join(' ')}"
    common_strings = pre & suf
    if common_strings.empty?
      table.push(0)
    else
      table.push(common_strings[0].length)
    end
    # puts "length #{n}, table is: #{table.join(' ')}"
  end

  table
end

# prefixes array for a string
def prefixes(str, length)
  result = []
  str_len = str.length
  str = str[0..length-1]

  raise Exception.new("match table length cannot exceeds string length") if length > str_len

  (1..length-1).each do |len|
    result.push str[0..len-1]
  end

  result
end

# suffixes array for a string
def suffixes(str, length)
  result = []
  str_len = str.length
  str = str[0..length-1]

  raise Exception.new("match table length cannot exceeds string length") if length > str_len

  (length-1).downto(1).each do |len|
    result.push str[str_len-len..str_len-1]
  end

  result
end
