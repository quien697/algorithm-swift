//
//  MaxConsecutiveOnes.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-26.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 485. Max Consecutive Ones
 * https://leetcode.com/problems/max-consecutive-ones
 *
 **/
enum MaxConsecutiveOnes: ProblemProtocol {
  static let name: String = "Max Consecutive Ones"
  static let domain: Domain = .Array
  static let testCases: [([Int], Int)] = [
    ([1,1,0,1,1,1], 3),
    ([1,0,1,1,0,1], 2),
  ]
  
  /**
   *
   * Approach: LinearScan
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum LinearScan: ApproachProtocol {
    static let approaches: [Approach] = [
      .LinearScan,
      .OnePass,
      .Greedy
    ]
    
    static func solve(_ nums: [Int]) -> Int {
      var result = 0
      var currCount = 0
      
      for num in nums {
        if num == 1 {
          currCount += 1
        } else {
          result = max(result, currCount)
          currCount = 0
        }
      }
      
      return max(result, currCount)
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "nums = \(input)"
        }
      )
    }
  }
}
