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
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "Prices = \(input)"
        }
      )
    }
  }
  
  /**
   *
   * Approaches: Dynamic Programming (Bottom Up)
   * Time: O(N)
   * Space: O(N)
   *
   * Relation: dp[n] = max(dp[i-1], (prices[n] - minPrice))
   *
   */
  enum DynamicProgramming: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ prices: [Int]) -> Int {
      let n = prices.count
      var dp = [Int](repeating: 0, count: n)
      var minPrice = prices[0]
      
      for i in 1..<n {
        let price = prices[i]
        minPrice = min(minPrice, price)
        dp[i] = max(dp[i - 1], (price - minPrice))
      }
      
      return dp[n - 1]
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "Prices = \(input)"
        }
      )
    }
  }
}
