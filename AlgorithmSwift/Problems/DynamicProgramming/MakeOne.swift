//
//  MakeOne.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-23.
//

import Foundation

/**
 *
 * Make One
 *
 * Given a number `n`, find the minimum number of operations required to reduce it to `1`.
 *
 * You can perform the following operations:
 * - If `n` is divisible by 3, divide by 3
 * - If `n` is divisible by 2, divide by 2
 * - subtract 1
 *
 * Example:
 *   Input: n = 10
 *   Output: 3
 *   Explanation: 10 → 9 → 3 → 1 (3 operations)
 *
 * Constraints:
 *  (1 ≤ n ≤ 1000000)
 *
 * Return:
 *  The minimum number of operations required to make `n` equal to 1.
 *
 **/
enum MakeOne: ProblemProtocol {
  static let name: String = "Make One"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [(Int, Int)] = [
    (1, 0),
    (2, 1),
    (3, 1),
    (4, 2),
    (6, 2),
    (7, 3),
    (9, 2),
    (10, 3),
    (15, 4),
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N)
   * Space: O(N)
   *
   * Relation: dp[n] = min(
   *  dp[n - 1] + 1,
   *  dp[n / 2] + 1  where n % 2 == 0,
   *  dp[n / 3] + 1  where n % 3 == 0
   * )
   *
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ n: Int) -> Int {
      guard n > 1 else { return 0 }
      
      var dp = [Int](repeating: 0, count: n + 1)
      
      for i in 2...n {
        dp[i] = dp[i - 1] + 1
        
        if i % 2 == 0 {
          dp[i] = min(dp[i], dp[i / 2] + 1)
        }
        
        if i % 3 == 0 {
          dp[i] = min(dp[i], dp[i / 3] + 1)
        }
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
   * Approach: Dynamic Programming (Top Down)
   * Time: O(N)
   * Space: O(N)
   *
   * Relation: dp[n] = min(
   *  dp[n - 1] + 1,
   *  dp[n / 2] + 1  where n % 2 == 0,
   *  dp[n / 3] + 1  where n % 3 == 0
   * )
   *
   *
   */
  enum DPTopDown: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .TopDown,
    ]
    
    static func solve(_ n: Int) -> Int {
      guard n > 1 else { return 0 }
      
      var dp = [Int](repeating: 0, count: n + 1)
      helper(n, &dp)
      
      return dp[n]
    }
    
    @discardableResult
    static func helper(_ n: Int, _ dp: inout [Int]) -> Int {
      // Base case
      if n == 1 { return 0 }
      
      // If already computed, return memoized value
      if dp[n] > 0 { return dp[n] }
      
      // Main logic
      dp[n] = helper(n - 1, &dp) + 1
      if n % 2 == 0 { dp[n] = min(helper(n, &dp), helper(n / 2, &dp) + 1) }
      if n % 3 == 0 { dp[n] = min(helper(n, &dp), helper(n / 3, &dp) + 1) }
      
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
}
