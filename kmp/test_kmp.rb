load './kmp.rb'

def test_kmp
  data = [{
    base: "BBC ABCDAB ABCDABCDABDE", 
    template: "ABCDABD", 
    index: 15
  }, {
    base: "aabbccddee", 
    template: "ccdd", 
    index: 4
  }, {
    base: "dbvcfslqwe", 
    template: "aaaaa", 
    index: -1
  }]

  data.each do |d|
    index = kmp(d[:base], d[:template])

    if index == d[:index]
      puts "+ kmp passes on #{d[:base]} and #{d[:template]}!"
    else
      puts "- kmp failed on #{d[:base]} and #{d[:template]}."
    end
  end
end

test_kmp

def test_prefixes
  template = "ABCDABD"

  result = prefixes(template, 7)

  if result == ['A', 'AB', 'ABC', 'ABCD', 'ABCDA', 'ABCDAB']
    puts "+ prefixes passes!"
  else
    puts "- prefixes failed."
  end
end

test_prefixes

def test_suffixes
  template = "ABCDABD"

  result = suffixes(template, 7)

  if result == ['BCDABD', 'CDABD', 'DABD', 'ABD', 'BD', 'D']
    puts "+ suffixes passes!"
  else
    puts "- suffixes failed."
  end
end

test_suffixes

def test_match_table
  template = "ABCDABD"

  table = make_match_table(template)

  if table == [0, 0, 0, 0, 1, 2, 0]
    puts "+ match_table passes!"
  else
    puts "- match_table failed."
  end
end

test_match_table
