//
//  PerfectSquares.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-17.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 279. Perfect Squares
 * https://leetcode.com/problems/perfect-squares
 *
 **/
enum PerfectSquares: ProblemProtocol {
  static let name: String = "Perfect Squares"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [(Int, Int)] = [
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2),
    (6, 3),
    (12, 3),
    (13, 2),
    (16, 1),
    (9999, 4),
    (10000, 1),
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N x √N))
   * Space: O(N)
   *
   * Relation: dp[i] = min(dp[i], dp[i - (j * j) ] + 1) for each j where j * j ≤ i
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ n: Int) -> Int {
      guard n > 0 else { return 0 }
      
      var dp = [Int](repeating: n + 1, count: n + 1)
      let squares = (1...Int(Double(n).squareRoot())).map { $0 * $0 }
      dp[0] = 0
      
      for target in 1...n {
        for square in squares where square <= target {
          dp[target] = min(dp[target], dp[target - square] + 1)
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
          "n = \(input)"
        }
      )
    }
  }
}
