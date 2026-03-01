//
//  RemoveElement.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-03-01.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 27. Remove Element
 * https://leetcode.com/problems/remove-element
 *
 */
enum RemoveElement: ProblemProtocol {
  static let name: String = "Remove Element"
  static let domain: Domain = .Array
  static let testCases: [(([Int], Int), Int)] = [
    (([3,2,2,3], 3), 2),
    (([0,1,2,2,3,0,4,2], 2), 5),
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
      .TwoPointers,
      .SlowFast,
    ]
    
    static func solve(_ nums: inout [Int], _ val: Int) -> Int {
      var slow = 0
      
      for fast in 0..<nums.count {
        if nums[fast] != val {
          nums[slow] = nums[fast]
          slow += 1
        }
      }
      
      return slow
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: { (input: [Int], val: Int) -> Int in
          var nums = input
          return solve(&nums, val)
        },
        inputDescription: { input in
          "nums = \(input.0), val = \(input.1)"
        }
      )
    }
  }
}
