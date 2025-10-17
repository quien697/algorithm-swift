//
//  CoinChange.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-17.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 322. Coin Change
 * https://leetcode.com/problems/coin-change
 *
 **/
enum CoinChange: ProblemProtocol {
  static let name: String = "Coin Change"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [(([Int], Int), Int)] = [
    (([1,2,5], 11), 3),
    (([2], 3), -1),
    (([1], 0), 0)
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N x M)
   * Space: O(N)
   *   - N = amount
   *   - M = number of coin
   *
   * Relation: dp[n] = min(d[n], d[n - coin] + 1) for all coins where coin ≤ n
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ coins: [Int], _ amount: Int) -> Int {
      guard amount > 0 else { return 0 }
      
      var dp = [Int](repeating: amount + 1, count: amount + 1)
      dp[0] = 0
      
      for currAmount in 1...amount {
        for coin in coins where currAmount >= coin {
          dp[currAmount] = min(dp[currAmount], dp[currAmount - coin] + 1)
        }
      }
      
      return dp[amount] > amount ? -1 : dp[amount]
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let coins = testCase.0.0
        let amount = testCase.0.1
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("coins = \(coins), amount = \(amount)")
        print("Result = ", solve(coins, amount))
        print("Expected = ", expected)
      }
    }
  }
}
