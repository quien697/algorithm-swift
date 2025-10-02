//
//  RemoveDuplicatesFromSortedArray.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-10.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 26. Remove Duplicates from Sorted Array
 * https://leetcode.com/problems/remove-duplicates-from-sorted-array/
 *
 */
enum RemoveDuplicatesFromSortedArray: ProblemProtocol {
  static let name: String = "Remove Duplicates from Sorted Array"
  static let domain: Domain = .Array
  static let testCases: [([Int], Int)] = [
    ([1,1,2], 2),
    ([0,0,1,2,3,3,4,4,5], 6),
  ]
  
  /**
   *
   * Approach: Sorting + Two Pointers (Slow-Fast)
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum TwoPointers: ApproachProtocol {
    static let approaches: [Approach] = [
      .Sorting,
      .TwoPointers,
      .SlowFast,
    ]
    
    static func solve(_ nums: inout [Int]) -> Int {
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
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        var nums = testCase.0
        let result = solve(&nums)
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("Nums = \(nums)")
        print("Result =", result, ",nums =", Array(nums.prefix(result)))
        print("Expected = ", expected)
      }
    }
  }
}
