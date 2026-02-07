//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-04.
//



import Foundation

/**
 *
 * LeetCode
 *
 * 3. Longest Substring Without Repeating Characters
 * https://leetcode.com/problems/longest-substring-without-repeating-characters
 *
 **/
enum LongestSubstringWithoutRepeatingCharacters: ProblemProtocol {
  static let name: String = "Longest Substring Without Repeating Characters"
  static let domain: Domain = .String
  static let testCases: [(String, Int)] = [
    ("abcabcbb", 3),
    ("bbbbb", 1),
    ("pwwkew", 3),
  ]
  
  /**
   *
   * Approach: SlidingWindow + HashTable
   * Time: O(N)
   * Space: O(N)
   *
   */
  enum SlidingWindow: ApproachProtocol {
    static let approaches: [Approach] = [
      .SlidingWindow,
      .HashTable
    ]
    
    static func solve(_ s: String) -> Int {
      var dict = [Character: Int]()
      var left = 0
      var maxLen = 0
      
      for (right , char) in s.enumerated() {
        if let index = dict[char] {
          left = max(left, index + 1)
        }
        
        dict[char] = right
        maxLen = max(maxLen, right - left + 1)
      }
      
      return maxLen
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
