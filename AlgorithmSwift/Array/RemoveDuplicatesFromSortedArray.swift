//
//  RemoveDuplicatesFromSortedArray.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-10.
//

import Foundation

/**
 * LeetCode
 *
 * 26. Remove Duplicates from Sorted Array
 * https://leetcode.com/problems/remove-duplicates-from-sorted-array/
 */

enum removeDuplicatesFromSortedArray {
  
  /**
   * Approach: Two ointer
   * Time: O(N)
   * Spafce: O(1)
   */
  static func solve (_ nums: inout [Int]) -> Int {
    var slow = 0
    var fast = 1
    
    while (nums.count > fast) {
      if (nums[slow] == nums[fast]) {
        fast += 1
      } else {
        slow += 1
        nums[slow] = nums[fast]
      }
    }
    
    return slow + 1
  }
  
  static func run () {
    print("=== RemoveDuplicatesFromSortedArray ===");
    
    var nums1: [Int] = [1, 1, 2]
    let len1 = solve(&nums1)
    print("\nCase 1:")
    print("Result = ", len1, ",nums = ", Array(nums1.prefix(len1)))
    
    var nums2: [Int] = [0, 0, 1, 2, 3, 3, 4, 4, 5]
    let len2 = solve(&nums2)
    print("\nCase 2:")
    print("Result = ", len2, ",nums = ", Array(nums2.prefix(len2)))
  }
}
