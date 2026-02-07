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
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: { (input: [Int]) -> Int in
          var nums = input
          return solve(&nums)
        },
        inputDescription: { input in
          "Nums = \(input)"
        }
      )
    }
  }
}
