class Solution:
    def threeSumClosest(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: int
        
        Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.

        For example, given array S = {-1 2 1 -4}, and target = 1.
        The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
        
        idea:
        0. sort the array, add variables
            1) ret for recording the nearest sum
            2) previous_sign
            3) previous_sum
        1. make one pivot and iterate by it(start from the leftmost one)
        2. choose leftmost and rightmost number of the rest list
        3. move pivot +1
        """

        if len(nums) < 3: return 0
        nums.sort()
        ret = 99999999
        # previous_sum = None
        diff = 99999999

        length = len(nums)

        for i in range(0, length-2):
            start, end = i + 1, length - 1
            # previous_sum = None
            while start < end:
                sum = nums[i] + nums[start] + nums[end]
                if sum == target: return target
                # print("> i = %d(%d), start = %d(%d), end = %d(%d)" % (i, nums[i], start, nums[start], end, nums[end]))
                # print("  > sum = %d and ret = " % (sum), end="")
                # print(ret)
                if abs(sum - target) < diff:
                    # print("  > update ret = sum = %d" % (sum))
                    ret = sum
                    diff = abs(ret - target)

                # if previous_sum is not None and abs(sum - target) > abs(previous_sum - target):
                #     break

                if sum < target:
                    start += 1
                else:
                    end -= 1

                # previous_sum = sum
                # print("  > previous_sum becomes %d" % (previous_sum))

        return ret

#### Test
s = Solution()
num_list = [
    ([-1, 2, 1, -4], 1, 2), 
    ([0,2,1,-3], 1, 0), 
    ([0, 0, 0], 1, 0), 
    ([1,1,-1,-1,3], -1, -1), 
    ([1,2,4,8,16,32,64,128], 82, 82), 
    ([-55,-24,-18,-11,-7,-3,4,5,6,9,11,23,33], 0, 0)
] 

for cell in num_list:
    nums = cell[0]
    target = cell[1]
    correct = cell[2]
    ret = s.threeSumClosest(nums, target)
    print("closet ret of target %d in " % (target), end="")
    print(nums, end="")
    print(" is %d" % (ret))
    if correct == ret:
        print("> Correct!")
    else:
        print("..Wrong..")
    print("------------------------")
