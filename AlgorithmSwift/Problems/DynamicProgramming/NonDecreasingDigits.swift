//
//  NonDecreasingDigits.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-17.
//

import Foundation

/**
 *
 * Non-decreasing Digits
 *
 * A number is called non-decreasing if each digit is not smaller than the one before it.
 *
 * Given an integer `n`, return the total number of non-decreasing numbers that have exactly `n` digits.
 * A number can start with `0`.
 *
 * Constraints: `(1 <= n <= 100)`
 *
 **/
enum NonDecreasingDigits: ProblemProtocol {
  static let name: String = "Non-decreasing Digits"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [(Int, Int)] = [
    (1, 10),
    (2, 55),
    (3, 220),
    (4, 715),
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N x 10)
   * Space: O(N x 10)
   *
   * Relation: dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ n: Int) -> Int {
      guard n > 0 else { return 0 }
      if n == 1 { return 10 }
      
      var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n + 1)
      dp[1] = Array(repeating: 1, count: 10)
      
      
      for len in 2...n {
        dp[len][0] = 1
        
        for d in 1...9 {
          dp[len][d] = dp[len - 1][d] + dp[len][d - 1]
        }
      }
      
      return dp[n].reduce(0, +)
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
   * Time: O(N x 10)
   * Space: O(2 x 10)
   *
   * Relation: dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
   *
   */
  enum DPSpaceOptimized: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ n: Int) -> Int {
      guard n > 0 else { return 0 }
      if n == 1 { return 10 }
      
      var prev = [Int](repeating: 1, count: 10)
      var curr = [Int](repeating: 0, count: 10)
      
      for _ in 2...n {
        curr[0] = 1
        for d in 1..<10 {
          curr[d] = curr[d - 1] + prev[d]
        }
        
        prev = curr
      }
      
      return prev.reduce(0, +)
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
