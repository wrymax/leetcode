class Solution:
    # @param n, an integer
    # @return an integer
    def reverseBits(self, n):
        reverse = 0
        index = 32
        while index > 0:
            reverse = reverse << 1
            reverse += n & 1
            n = n >> 1
            index -= 1

        return reverse

#### Test
s = Solution()

ns = [43261596]  # 964176192
for i in ns:
    print i
    print s.reverseBits(i)
    print "####"

