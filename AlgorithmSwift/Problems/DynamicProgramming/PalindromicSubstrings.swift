//
//  PalindromicSubstrings.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-07.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 647. Palindromic Substrings
 * https://leetcode.com/problems/palindromic-substrings/
 *
 **/
enum PalindromicSubstrings: ProblemProtocol {
  static let name: String = "PalindromicSubstrings"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [(String, Int)] = [
    ("aba", 4),
    ("abc", 3),
    ("aaa", 6),
    ("aaabac", 10),
    ("abba", 6),
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N ^ 2)
   * Space: O(N ^ 2)
   *
   * Relation: dp[l][r] = s[l] == s[r]  AND (r - l <= 2 OR dp[l + 1][r - 1])
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ s: String) -> Int {
      let n = s.count
      if n == 1 { return 1 }
      
      let chars = Array(s)
      var dp = [[Bool]](repeating: [Bool](repeating: false, count: n) , count: n)
      var result = 0
      
      for r in 0..<n {
        for l in 0...r where chars[l] == chars[r] && (r - l <= 2 || dp[l+1][r-1]) {
          dp[l][r] = true
          result += 1
        }
      }
      
      return result
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
   * Approach: Expand Around Center
   * Time: O(N ^ 2)
   * Space: O(1)
   *
   */
  enum ExpandAroundCenter: ApproachProtocol {
    static let approaches: [Approach] = [
      .ExpandAroundCenter,
    ]
    
    static func solve(_ s: String) -> Int {
      let n = s.count
      if n == 1 { return 1 }
      
      let chars = Array(s)
      var result = 0
      
      for i in 0..<n {
        let oddCount = helper(chars, left: i, right: i)
        let evenCount = helper(chars, left: i, right: i + 1)
        result += oddCount + evenCount
      }
      
      return result
    }
    
    static private func helper(_ chars: [Character], left: Int, right: Int) -> Int {
      var left = left
      var right = right
      var count = 0
      
      while left >= 0 && right < chars.count && chars[left] == chars[right] {
        left -= 1
        right += 1
        count += 1
      }
      
      return count
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
