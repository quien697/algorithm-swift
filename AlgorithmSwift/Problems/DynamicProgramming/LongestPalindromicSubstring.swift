//
//  LongestPalindromicSubstring.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-14.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 5. Longest Palindromic Substring
 * https://leetcode.com/problems/longest-palindromic-substring
 *
 **/
enum LongestPalindromicSubstring: ProblemProtocol {
  static let name: String = "Longest Palindromic Substring"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [(String, Set<String>)] = [
    ("babad", ["bab", "aba"]),
    ("cbbd", ["bb"]),
    ("ccc", ["ccc"]),
    ("ac", ["a", "c"])
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
      .ExpandAroundCenter,
    ]
    
    static func solve(_ s: String) -> String {
      let n = s.count
      guard n > 1 else { return s }
      
      let chars = Array(s)
      var dp = [[Bool]](repeating: [Bool](repeating: false, count: n) , count: n)
      var left = 0
      var length = 1
      
      // base case: single letter palindromes
      for i in 0..<n { dp[i][i] = true }
      
      for r in 1..<n {
        for l in 0..<r where chars[l] == chars[r] && (dp[l+1][r-1] || r - l <= 2) {
          dp[l][r] = true
          
          let len = r - l + 1
          if len > length {
            length = len
            left = l
          }
        }
      }
      
      return String(chars[left..<left + length])
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let s = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("s = \(s)")
        print("Result = ", solve(s))
        print("Expected = ", expected.joined(separator: " | "))
      }
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
    
    static func solve(_ s: String) -> String {
      let n = s.count
      guard n > 1 else { return s }
      
      let chars = Array(s)
      var left = 0
      var right = 0
      
      for i in 0..<n {
        let oddLen = helper(chars, left: i, right: i)
        let evenLen = helper(chars, left: i, right: i + 1)
        
        let maxLen = max(oddLen, evenLen)
        
        if maxLen > right - left + 1 {
          left = i - (maxLen - 1) / 2
          right = i + maxLen / 2
        }
      }
      
      return String(chars[left...right])
    }
    
    static private func helper(_ chars: [Character], left: Int, right: Int) -> Int {
      var left = left
      var right = right
      
      while left >= 0 && right < chars.count && chars[left] == chars[right] {
        left -= 1
        right += 1
      }
      
      return right - left - 1
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let s = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("s = \(s)")
        print("Result = ", solve(s))
        print("Expected = ", expected.joined(separator: " | "))
      }
    }
  }
  
  // Manacher’s algorithm
  // might implement this later
}
