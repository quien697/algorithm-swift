//
//  LongestRepeatingCharacterReplacement.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-10.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 424. Longest Repeating Character Replacement
 * https://leetcode.com/problems/longest-repeating-character-replacement
 *
 **/
enum LongestRepeatingCharacterReplacement: ProblemProtocol {
  static let name: String = "Longest Repeating Character Replacement"
  static let domain: Domain = .String
  static let testCases: [((String, Int), Int)] = [
    (("ABAB", 2), 4),
    (("AABABBA", 1), 4),
  ]
  
  /**
   *
   * Approach: SlidingWindow + HashTable
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum SlidingWindow: ApproachProtocol {
    static let approaches: [Approach] = [
      .SlidingWindow,
      .HashTable
    ]
    
    static func solve(_ s: String, _ k: Int) -> Int {
      let s = Array(s)
      var dict = [Character: Int]()
      var left = 0
      var currMaxCount = 0
      var maxLen = 0
      
      for (right , char) in s.enumerated() {
        dict[char, default: 0] += 1
        currMaxCount = max(currMaxCount, dict[char]!)
        let windowLen = right - left + 1
        
        if (windowLen - currMaxCount) <= k {
          maxLen = max(maxLen, windowLen)
        } else {
          dict[s[left], default: 0] -= 1
          left += 1
        }
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
          "s = \(input.0), k = \(input.1)"
        }
      )
    }
  }
}
