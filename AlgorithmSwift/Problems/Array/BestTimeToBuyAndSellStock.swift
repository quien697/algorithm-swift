//
//  BestTimeToBuyAndSellStock.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-01.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 121. Best Time to Buy and Sell Stock
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock
 *
 **/
enum BestTimeToBuyAndSellStock: ProblemProtocol {
  static let name = "Best Time to Buy and Sell Stock"
  static let domain: Domain = .Array
  static let testCases: [([Int], Int)] = [
    ([7,1,5,3,6,4], 5),
    ([7,6,4,3,1], 0)
  ]
  
  /**
   *
   * Approaches: Greedy + Two Pointers (Slow-Fast)
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum Greedy: ApproachProtocol {
    static let approaches: [Approach] = [
      .Greedy,
      .TwoPointers,
      .SlowFast,
    ]
    
    static func solve(_ prices: [Int]) -> Int {
      var buy = Int.max
      var profit = 0
      
      for sell in prices {
        buy = min(buy, sell)
        profit = max(profit, (sell - buy))
      }
      
      return profit
    }
    
    static func run () {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let price = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("Nums = \(price)")
        print("Result = ", solve(price))
        print("Expected = ", expected)
      }
    }
  }
  
  /**
   *
   * Approaches: Dynamic Programming (BottomUp)
   * Time: O(N)
   * Space: O(N)
   *
   */
  enum DynamicProblemming: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ prices: [Int]) -> Int {
      let n = prices.count
      var dp = [Int](repeating: 0, count: n)
      var buy = prices[0]
      
      for i in 1..<n {
        let sell = prices[i]
        buy = min(buy, sell)
        dp[i] = max(dp[i - 1], (sell - buy))
      }
      
      return dp[n - 1]
    }
    
    static func run () {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let price = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("Nums = \(price)")
        print("Result = ", solve(price))
        print("Expected = ", expected)
      }
    }
  }
}
