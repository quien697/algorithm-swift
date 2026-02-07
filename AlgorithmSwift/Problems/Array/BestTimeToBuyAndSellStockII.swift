//
//  BestTimeToBuyAndSellStockII.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-11.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 122. Best Time to Buy and Sell Stock II
 * https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii
 *
 **/
enum BestTimeToBuyAndSellStockII: ProblemProtocol {
  static let name = "Best Time to Buy and Sell Stock II"
  static let domain: Domain = .Array
  static let testCases: [([Int], Int)] = [
    ([7,1,5,3,6,4], 7),
    ([1,2,3,4,5], 4),
    ([7,6,4,3,1], 0)
  ]
  
  /**
   *
   * Approaches: Greedy
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum Greedy: ApproachProtocol {
    static let approaches: [Approach] = [
      .Greedy,
    ]
    
    static func solve(_ prices: [Int]) -> Int {
      var profit = 0
      
      for i in 0..<prices.count-1 {
        if prices[i] < prices[i + 1] {
          profit += prices[i + 1] - prices[i]
        }
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
          "prices = \(input)"
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
   * Relation: dp[n] = dp[n-1] + max(0, prices[n] - prices[n-1])
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
      
      for i in 1..<n {
        let profit = prices[i] > prices[i - 1] ? prices[i] - prices[i - 1] : 0
        dp[i] = dp[i - 1] + profit
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
          "prices = \(input)"
        }
      )
    }
  }
}
