//
//  SingleNumber.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-14.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 136. Single Number
 * https://leetcode.com/problems/single-number
 *
 **/
enum SingleNumber: ProblemProtocol {
  static let name: String = "Single Number"
  static let domain: Domain = .Array
  static let testCases: [([Int], Int)] = [
    ([1,2,2], 1),
    ([4,1,2,1,2], 4),
    ([1], 1)
  ]
  
  /**
   *
   * Approach: Bitwise (XOR)
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum Bitwise: ApproachProtocol {
    static let approaches: [Approach] = [
      .Bitwise,
      .XOR,
    ]
    
    static func solve(_ nums: [Int]) -> Int {
      // Using XOR (^) operator
      // var result = 0
      //
      // for num in nums {
      //   result ^= num
      // }
      //
      // return result
      
      // The same approach below, just condensed into a single line.
      return nums.reduce(0, ^)
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let nums = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("Nums = \(nums)")
        print("Result = ", solve(nums))
        print("Expected = ", expected)
      }
    }
  }
}
