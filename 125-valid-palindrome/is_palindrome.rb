# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  s_letters = s.gsub(/[^\w]/, '').downcase
  s_letters == s_letters.reverse
end
