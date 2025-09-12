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
enum BestTimeToBuyAndSellStockII {
  
  /**
   *
   * Approach: Greedy
   * Time: O(N)
   * Space: O(1)
   *
   */
  static func solve(_ prices: [Int]) -> Int {
    var profit = 0
    
    for i in 0..<prices.count-1 {
      if prices[i] < prices[i + 1] {
        profit += prices[i + 1] - prices[i]
      }
    }
    
    return profit
  }
  
  static func run () {
    print("=== Best Time to Buy and Sell Stock II ===");
    
    let prices1: [Int] = [7, 1, 5, 3, 6, 4]
    print("\nCase 1:")
    print("Prices = \(prices1)")
    print("Result = \(solve(prices1))")
    
    let prices2: [Int] = [1, 2, 3, 4, 5]
    print("\nCase 2:")
    print("Prices = \(prices2)")
    print("Result = \(solve(prices2))")
    
    let prices3: [Int] = [7, 6, 4, 3, 1]
    print("\nCase 3:")
    print("Prices = \(prices3)")
    print("Result = \(solve(prices3))")
  }
}
