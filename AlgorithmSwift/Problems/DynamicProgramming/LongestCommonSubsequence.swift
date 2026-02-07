//
//  LongestCommonSubsequence.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-29.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 1143. Longest Common Subsequence
 * https://leetcode.com/problems/longest-common-subsequence
 *
 **/
enum LongestCommonSubsequence: ProblemProtocol {
  static let name: String = "Longest Common Subsequence"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [((String, String), Int)] = [
    (("abcde", "ace"), 3),
    (("abc", "abc"), 3),
    (("abc", "def"), 0),
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N x M)
   * Space: O(N x M)
   *   - N = length of text1
   *   - M = length of text2
   *
   * Relation: dp[i][j] =
   *  if text1[i] == text2[j]
   *    dp[i - 1][j - 1] + 1
   *  else
   *    max(dp[i-1][j], dp[i][j-1])
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ text1: String, _ text2: String) -> Int {
      let text1 = Array(text1)
      let text2 = Array(text2)
      let n = text1.count
      let m = text2.count
      var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
      
      for i in 1...n {
        for j in 1...m {
          if text1[i-1] == text2[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
          } else {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
          }
        }
      }
      
      return dp[n][m]
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "text1 = \(input.0), text2 = \(input.1)"
        }
      )
    }
  }
}
