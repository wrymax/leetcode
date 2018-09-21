# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    # 1. sort the array
    # 2. start from 0 and length - 1,
    #   if larger than target, remove this element, then the large index iterates to length - 2...
    #       if there is a matched sum, then end
    #       if a sum < target, then the less index iterates to 1
    #       when less index touches the center element(even length and odd length) and no matches, then there are no matches
    result = []
    
    new_array = make_sorted_array(nums)
    len = new_array.length

    # start from [0] + [len-1]
    index = 0
    while index <= len-2 do
        small = new_array[index][0]
        large = new_array[len-1][0]
        puts "index = #{index}: nums[#{index}] + nums[#{len-1}] = #{small + large}"
        if small + large == target
            result = [new_array[index][1],  new_array[len-1][1]]
            break
        elsif small + large > target
            new_array.pop
            len = new_array.length
        else
            index += 1
        end
    end

    return result
end

def make_sorted_array(arr)
  index = 0
  arr.map do |n|
    r = [n, index]
    index += 1
    r
  end.sort_by do |i|
    i[0]
  end
end


arr = [3, 2, 4]
target = 6

puts two_sum(arr, target)
