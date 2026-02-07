//
//  DecodeWays.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-22.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 91. Decode Ways
 * https://leetcode.com/problems/decode-ways
 *
 **/
enum DecodeWays: ProblemProtocol {
  static let name: String = "Decode Ways"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [(String, Int)] = [
    ("12", 2),
    ("226", 3),
    ("06", 0),
    ("1", 1),
    ("266101", 2),
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N)
   * Space: O(N)
   *
   * Relation: dp[n] = dp[i - 1] where digits[n - 1] != 0
   *             + dp[i - 2] where 10 <= (digits[n - 2] * 10 + digits[n - 1]) <= 26
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ s: String) -> Int {
      let digits = s.compactMap(\.wholeNumberValue)
      let n = digits.count
      
      guard n > 0, digits[0] != 0 else { return 0 }
      guard n > 1 else { return 1 }
      
      var dp = [Int](repeating: 0, count: n + 1)
      dp[0] = 1
      dp[1] = 1
      
      for i in 2...n {
        if digits[i - 1] != 0 {
          dp[i] += dp[i - 1]
        }
        
        let twoDigits = digits[i - 2] * 10 + digits[i - 1]
        
        if 10...26 ~= twoDigits {
          dp[i] += dp[i - 2]
        }
      }

      return dp[n]
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "s = \(input)"
        }
      )
    }
  }
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up + Space Optimized)
   * Time: O(N)
   * Space: O(1)
   *
   * Relation: dp[n] = dp[i - 1] where digits[n - 1] != 0
   *             + dp[i - 2] where 10 <= (digits[n - 2] * 10 + digits[n - 1]) <= 26
   *
   */
  enum DPBottomUpOptimized: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
      .SpaceOptimized,
    ]
    
    static func solve(_ s: String) -> Int {
      let digits = s.compactMap(\.wholeNumberValue)
      let n = digits.count
      
      guard n > 0, digits[0] != 0 else { return 0 }
      guard n > 1 else { return 1 }
      
      var prev1 = 1
      var prev2 = 1
      
      for i in 2...n {
        var curr = 0
        
        if digits[i - 1] != 0 {
          curr += prev1
        }
        
        let twoDigits = digits[i - 2] * 10 + digits[i - 1]
        
        if 10...26 ~= twoDigits {
          curr += prev2
        }
        
        prev2 = prev1
        prev1 = curr
      }

      return prev1
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "s = \(input)"
        }
      )
    }
  }
}
