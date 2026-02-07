//
//  LongestPalindromicSubsequence.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-16.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 516. Longest Palindromic Subsequence
 * https://leetcode.com/problems/longest-palindromic-subsequence
 *
 **/
enum LongestPalindromicSubsequence: ProblemProtocol {
  static let name: String = "Longest Palindromic Subsequence"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [(String, Int)] = [
    ("bbbab", 4),
    ("cbbd", 2)
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N ^ 2)
   * Space: O(N ^ 2)
   *
   * Relation: dp[i][j] =
   *  if s[i] == s.reversed()[j]
   *    dp[i - 1][j - 1] + 1
   *  else
   *    max(dp[i-1][j], dp[i][j-1])
   *
   * PS: The same as `1143. Longest Common Subsequence` (LCS) approach.
   *
   */
  enum DPBottomUpLCS: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ s: String) -> Int {
      let text1 = s
      let text2 = String(s.reversed())
      
      return LongestCommonSubsequence.DPBottomUp.solve(text1, text2)
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
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N ^ 2)
   * Space: O(N ^ 2)
   *
   * Relation: dp[l][r] =
   *  if s[l] == s[r]
   *    dp[l + 1][r - 1] + 2
   *  else
   *    max(dp[l + 1][r], dp[l][r - 1])
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ s: String) -> Int {
      let n = s.count
      guard n > 1 else { return 1 }
      
      let chars = Array(s)
      var dp = [[Int]](repeating: [Int](repeating: 0, count: n) , count: n)
      
      // base case: single letter palindromes
      for i in 0..<n { dp[i][i] = 1 }
      
      for length in 2...n {
        // l = left, r = right
        for l in 0...(n - length) {
          let r = l + length - 1
          
          if chars[l] == chars[r] {
            dp[l][r] = (length == 2) ? 2 : dp[l + 1][r - 1] + 2
          } else {
            dp[l][r] = max(dp[l + 1][r], dp[l][r - 1])
          }
        }
      }
      
      return dp[0][n - 1]
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
