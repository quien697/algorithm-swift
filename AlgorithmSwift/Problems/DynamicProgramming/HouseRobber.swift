//
//  HouseRobber.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-02.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 198. House Robber
 * https://leetcode.com/problems/house-robber
 *
 **/
enum HouseRobber: ProblemProtocol {
  static let name: String = "House Robber"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [([Int], Int)] = [
    ([1,2,3,1], 4),
    ([2,7,9,3,1], 12),
    ([1], 1),
    ([1, 2], 2),
    ([2,1,1,2], 4)
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N)
   * Space: O(N)
   *
   * Relation: dp[n] = max(dp[n-1], nums[n] + dp[n-2])
   *
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ nums: [Int]) -> Int {
      let n = nums.count + 2
      var dp = [Int](repeating: 0, count: n)
      
      for i in 2..<n {
        dp[i] = max(dp[i - 1], nums[i - 2] + dp[i - 2])
      }
      
      return dp[n - 1]
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let nums = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("nums = \(nums)")
        print("Result = ", solve(nums))
        print("Expected = ", expected)
      }
    }
  }
  
  /**
   *
   * Approach: Dynamic Programming (Space Optimized)
   * Time: O(N)
   * Space: O(1)
   *
   * Relation: dp[n] = max(dp[n-1], nums[n] + dp[n-2])
   *
   */
  enum DPSpaceOptimized: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
    ]
    
    static func solve(_ nums: [Int]) -> Int {
      var prev1 = 0
      var prev2 = 0
      
      for num in nums {
        let curr = max(prev2, num + prev1)
        prev1 = prev2
        prev2 = curr
      }
      
      return prev2
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let nums = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("nums = \(nums)")
        print("Result = ", solve(nums))
        print("Expected = ", expected)
      }
    }
  }
}
