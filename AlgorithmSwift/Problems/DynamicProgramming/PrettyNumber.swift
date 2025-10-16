//
//  PrettyNumber.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-16.
//

import Foundation

/**
 *
 * Pretty Number
 *
 * Definition: a number is pretty if the difference between every two adjacent digits is exactly 1.
 *
 * Constraints: `(1 <= n <= 100)`
 *
 **/
enum PrettyNumber: ProblemProtocol {
  static let name: String = "Pretty Number"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [(Int, Int)] = [
    (1, 9),
    (2, 17),
    (3, 32),
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N * 10)
   * Space: O(N * 10)
   *
   * Relation: dp[n][d] = (d > 0 ? dp[n-1][d-1] : 0) + (d < 9 ? dp[n-1][d+1] : 0)
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ n: Int) -> Int {
      guard n > 0 else { return 0 }
      if n == 1 { return 9 }
      
      var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n + 1)
      (1...9).forEach { dp[1][$0] = 1 }
      
      for len in 2...n {
        for d in 0..<10 {
          if d > 0 { dp[len][d] += dp[len - 1][d - 1] }
          if d < 9 { dp[len][d] += dp[len - 1][d + 1] }
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
   * Time: O(N * 10)
   * Space: O(2 * 10)
   *
   * Relation: dp[n][d] = (d > 0 ? dp[n-1][d-1] : 0) + (d < 9 ? dp[n-1][d+1] : 0)
   *
   */
  enum DPSpaceOptimized: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ n: Int) -> Int {
      guard n > 0 else { return 0 }
      if n == 1 { return 9 }
      
      var prev = [Int](repeating: 0, count: 10)
      var curr = [Int](repeating: 0, count: 10)
      (1...9).forEach { prev[$0] = 1 }
      
      for _ in 2...n {
        for d in 0..<10 {
          curr[d] = (d > 0 ? prev[d - 1] : 0 ) + (d < 9 ? prev[d + 1] : 0 )
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
