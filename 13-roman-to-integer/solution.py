class Solution:
    def romanToInt(self, s):
        """
        :type s: str
        :rtype: int
        """
        if len(s) == 0:
            return 0 
        value_map = {
            'I': 1, 
            'V': 5, 
            'X': 10, 
            'L': 50, 
            'C': 100, 
            'D': 500, 
            'M': 1000
        }
        ret = 0
        length = len(s)
        i = 0
        while i <= length - 1:
            if i + 1 <= length - 1:
                if value_map[s[i]] < value_map[s[i+1]]:
                    ret += value_map[s[i+1]] - value_map[s[i]]
                    i += 2
                    continue
            ret += value_map[s[i]]
            i += 1

        return ret


s = Solution()
cases = {
    "MCMXCIV": 1994, 
    "LVIII": 58, 
    "IX": 9, 
    "IV": 4, 
    "III": 3
}
for k, v in cases.items():
    ret = s.romanToInt(k)
    if cases[k] == ret:
        print("%s = %d passed!".format(k, v))
    else:
        print("%s = %d failed! Calculated as %d".format(k, v, ret))
