# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
  recovered_arr = recover(head)
  letters = recovered_arr.select{ |i| 
    i.is_a?(Numeric) || i.is_a?(String) && i.match(/\w/)
  }.map{ |i| 
    i = i.downcase if i.is_a?(String) 
    i
  }
  # puts letters
  letters == letters.reverse
end

def recover(node)
  ret = []
  while node do
    ret.push node.val
    node = node.next
  end

  ret
end

### below is for test on LinkedList
def init_linked_list(str)
  head_node = nil
  last_node = nil
  (0..str.length-1).each do |i|
    val = str[i]
    if val.match(/\d/)
      val = val.to_i
    end
    node = ListNode.new(val)
    head_node = node if i == 0
    last_node.next = node if last_node
    last_node = node
  end

  return head_node
end

# test linked list

# str = "A man, a plan, a canal: Panama"
def test_linked_list(test_str)
  puts "--- test_linked_list"
  puts "input str: #{test_str}"
  node = init_linked_list(test_str)
  str_ret = ""
  while node do
    str_ret += "<ListNode val='#{node.val}'>"
    node = node.next
    if node
      str_ret += " -> "
    end
  end

  puts str_ret
end

def test_recover_str(str)
  puts "--- test_recover_str"
  node = init_linked_list(str)
  if recover(node).join() == str
    puts "+ test_recover_str PASS"
  else
    puts "- test_recover_str FAIL"
  end
end

def test_is_palindrome
  puts "--- test_is_palindrome"
  node = init_linked_list('12')
  if is_palindrome(node)
    puts "- test_is_palindrome FAIL: 12"
  else
    puts "+ test_is_palindrome PASS: 12"
  end

  node = init_linked_list("A man, a plan, a canal: Panama")
  if is_palindrome(node)
    puts "+ test_is_palindrome PASS: A man, a plan, a canal: Panama"
  else
    puts "- test_is_palindrome FAIL: A man, a plan, a canal: Panama"
  end

end

test_linked_list('1')
test_recover_str("oh my god")
test_is_palindrome
