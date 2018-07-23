class Solution:
    def removeElement(self, nums, val):
        """
        :type nums: List[int]
        :type val: int
        :rtype: int
        """
        l = len(nums)
        i = 0
        
        while i < l:
            while i < l and nums[i] == val:
                nums[i] = nums[l-1]
                nums.pop()
                l -= 1
            i += 1

        return len(nums)
