//
//  MaximumSubarray.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-02.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 53. Maximum Subarray
 * https://leetcode.com/problems/maximum-subarray
 *
 **/
enum MaximumSubarray: ProblemProtocol {
  static let name: String = "Maximum Subarray"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [([Int], Int)] = [
    ([-2,1,-3,4,-1,2,1,-5,4], 6),
    ([1], 1),
    ([5,4,-1,7,8], 23),
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N)
   * Space: O(N)
   *
   * Relation: dp[n] = nums[n] + max(dp[n - 1], 0)
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ nums: [Int]) -> Int {
      let n = nums.count
      var dp = [Int](repeating: 0, count: n)
      dp[0] = nums[0]
      
      for i in 1..<n {
        dp[i] = nums[i] + max(dp[i - 1], 0)
      }
      
      return dp.max()!
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
   * Approach: Kadane's Algorithm
   * Time: O(N)
   * Space: O(1)
   *
   * Relation: dp[n] = nums[n] + max(dp[n - 1], 0)
   *
   */
  enum Kadanes: ApproachProtocol {
    static let approaches: [Approach] = [
      .Kadanes,
      .DynamicProgramming,
      .Greedy,
    ]
    
    static func solve(_ nums: [Int]) -> Int {
      var curNum = 0
      var maxNum = 0
      
      for num in nums {
        curNum = num + max(curNum, 0)
        maxNum = max(maxNum, curNum)
      }
      
      return maxNum
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
