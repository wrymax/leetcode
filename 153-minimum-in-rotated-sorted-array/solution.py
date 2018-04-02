class Solution:
  # A stupid solution:
  def findMinStupidWay(self, nums):
    """
    :type nums: List[int]
    :rtype: int
    """
    if not any(nums): return False
    if len(nums) == 1: return nums[0]
    
    index = 0
    for i in range(len(nums)):
      if i == 0: continue;
      if nums[i] < nums[i-1]:
        index = i
        return nums[i]
    
    if index == 0:
      return nums[0]
  
  # A faster way: divide-and-conquer
  def findMin(self, nums):
    if not any(nums): return False
    if len(nums) == 1: return nums[0]
    if len(nums) == 2:
      if nums[0] < nums[1]:
        return nums[0]
      else:
        return nums[1]
    
    start_pivot = self.make_pivot(len(nums)-1, 0)
    i = self.find(nums, start_pivot, 0, len(nums)-1)
    
    return nums[i]
    
  def find(self, nums, pivot, start_index, end_index):
    if nums[pivot] > nums[end_index]:
      if pivot == end_index - 1:
        return end_index
      else:
        return self.find(nums, self.make_pivot(end_index, pivot), pivot, end_index)
    elif nums[pivot] < nums[start_index]:
      if pivot == start_index + 1:
        return pivot
      else:
        return self.find(nums, self.make_pivot(start_index, pivot), start_index, pivot)
    else:
      return 0

  def make_pivot(self, start_index, end_index):
    return int((start_index + end_index) / 2)

### Test
s = Solution()
l1 = [4, 5, 6, 7, 0, 1, 2]
[print(i, end=" ") for i in l1]
print("min is %d" % (s.findMin(l1)))

print("===========================")
l2 = [15, 25, 36, 47, 3, 8, 12]
[print(i, end=" ") for i in l2]
print("min is %d" % (s.findMin(l2)))

print("===========================")
l3_origin = list(range(100000))
l3 = l3_origin[35001:] + l3_origin[:35000]
# [print(i, end=" ") for i in l3]
print("min is %d" % (s.findMin(l3)))

print("===========================")
l4 = [1, 2]
# [print(i, end=" ") for i in l3]
print("min is %d" % (s.findMin(l4)))

print("===========================")
l5 = [1, 2, 3, 4, 5 ,6 ,7]
# [print(i, end=" ") for i in l3]
print("min is %d" % (s.findMin(l5)))
