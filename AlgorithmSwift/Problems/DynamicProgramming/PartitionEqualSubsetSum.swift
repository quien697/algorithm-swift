//
//  PartitionEqualSubsetSum.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-11-04.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 416. Partition Equal Subset Sum
 * https://leetcode.com/problems/partition-equal-subset-sum
 *
 **/
enum PartitionEqualSubsetSum: ProblemProtocol {
  static let name: String = "Partition Equal Subset Sum"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [([Int], Bool)] = [
    ([1,5,11,5], true),
    ([1,2,3,5], false),
    ([1,1,3,4,7], true),
    ([1,2,3,4], true),
    ([1,2,3,8], false),
    ([8], false),
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N x M)
   * Space: O(M)
   *   - N = length of nums
   *   - M = number of target
   *
   * Relation: dp[i] = dp[i] || dp[i - num] where num ≤ i
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ nums: [Int]) -> Bool {
      let sum = nums.reduce(0, +)
      guard sum % 2 == 0 else { return false }
      
      let target = sum / 2
      var dp = [true] + [Bool](repeating: false, count: target)
      
      for num in nums {
        for i in stride(from: target, through: num, by: -1) {
          dp[i] = dp[i] || dp[i - num]
        }
      }
      
      return dp[target]
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let n = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("n = \(n)")
        print("Result = ", solve(n))
        print("Expected = ", expected)
      }
    }
  }
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up + Set)
   * Time: O(N x M)
   * Space: O(M)
   *   - N = length of nums
   *   - M = length of dp
   *
   */
  enum DPBottomUpSet: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
      .Set,
    ]
    
    static func solve(_ nums: [Int]) -> Bool {
      let sum = nums.reduce(0, +)
      guard sum % 2 == 0 else { return false }
      
      let target = sum / 2
      var dp = Set<Int>()
      dp.insert(0)
      
      for num in nums.reversed() {
        var tempDp = Set<Int>()
        
        for i in dp {
          let sum = i + num
          if sum == target {
            return true
          }
          tempDp.insert(i)
          tempDp.insert(sum)
        }
        dp = tempDp
      }
      
      return false
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let n = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("n = \(n)")
        print("Result = ", solve(n))
        print("Expected = ", expected)
      }
    }
  }
}
