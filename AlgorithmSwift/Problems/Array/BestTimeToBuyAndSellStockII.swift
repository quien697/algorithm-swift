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
  enum greedy: ApproachProtocol {
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
