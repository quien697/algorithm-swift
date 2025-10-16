//
//  ClimbingStairs.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-01.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 70. Climbing Stairs
 * https://leetcode.com/problems/climbing-stairs
 *
 **/
enum ClimbingStairs: ProblemProtocol {
  static let name: String = "Climbing Stairs"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [(Int, Int)] = [
    (2, 2),
    (3, 3),
    (4, 5),
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N)
   * Space: O(N)
   *
   * Relation: dp[n] = dp[n-1] + dp[n-2]
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ n: Int) -> Int {
      guard n > 2 else { return n }
      
      var dp = [Int](repeating: 0, count: n + 1)
      dp[0] = 1
      dp[1] = 1
      
      for i in 2...n {
        dp[i] = dp[i-1] + dp[i-2]
      }

      return dp[n]
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
   * Approach: Dynamic Programming (Space Optimized)
   * Time: O(N)
   * Space: O(1)
   *
   * Relation: d[n] = d[n-1] + d[n-2]
   *
   */
  enum DPSpaceOptimized: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ n: Int) -> Int {
      guard n > 2 else { return n }
      
      var prev1 = 1
      var prev2 = 1
      
      for _ in 2...n {
        let curr = prev1 + prev2
        prev1 = prev2
        prev2 = curr
      }

      return prev2
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
   * Approach: Dynamic Programming (Top Down)
   * Time: O(N)
   * Space: O(N)
   *
   * Relation: d[n] = d[n-1] + d[n-2]
   *
   */
  enum DPTopDown: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .Recursion,
      .TopDown,
    ]
    
    static func solve(_ n: Int) -> Int {
      var dp = [Int](repeating: 0, count: n + 1)
      dp[0] = 1
      dp[1] = 1
      helper(n, &dp)
      
      return dp[n]
    }
    
    @discardableResult
    static func helper(_ n: Int, _ dp: inout [Int]) -> Int {
      if n < 2 { return 1 }
      if dp[n] > 0 { return dp[n] }
      
      let steps = helper(n - 1, &dp) + helper(n - 2, &dp)
      dp[n] = steps
      
      return steps
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
