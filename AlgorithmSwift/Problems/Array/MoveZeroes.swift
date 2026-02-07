//
//  MoveZeroes.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-17.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 283. Move Zeroes
 * https://leetcode.com/problems/move-zeroes
 *
 **/
enum MoveZeroes: ProblemProtocol {
  static let name: String = "Move Zeroes"
  static let domain: Domain = .Array
  static let testCases: [([Int], [Int])] = [
    ([0,1,0,3,12], [1,3,12,0,0]),
    ([0], [0]),
  ]
  
  /**
   *
   * Approach: Two Pointers (Slow-Fast)
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum TwoPointers: ApproachProtocol {
    static let approaches: [Approach] = [
      .TwoPointers,
      .SlowFast,
    ]
    
    static func solve(_ nums: inout [Int]) -> [Int] {
      var slow = 0
      
      for fast in 0..<nums.count {
        if nums[fast] != 0 {
          nums.swapAt(slow, fast)
          slow += 1
        }
      }
      
      return nums
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: { (input: [Int]) -> [Int] in
          var nums = input
          return solve(&nums)
        },
        inputDescription: { input in
          "nums = \(input)"
        }
      )
    }
  }
}
