//
//  ValidAnagram.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-22.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 242. Valid Anagram
 * https://leetcode.com/problems/valid-anagram
 *
 **/
enum ValidAnagram: ProblemProtocol {
  static let name: String = "Valid Anagram"
  static let domain: Domain = .String
  static let testCases: [((String, String), Bool)] = [
    (("anagram", "nagaram"), true),
    (("rat", "car"), false),
  ]
  
  /**
   *
   * Approach: Hash Table (Dictionary)
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum HashTable: ApproachProtocol {
    static let approaches: [Approach] = [
      .HashTable,
      .Dictionary,
    ]
    
    static func solve(_ s: String, _ t: String) -> Bool {
      guard s.count == t.count else { return false }
      
      var dict = s.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
      
      for char in t {
        if let count = dict[char], count > 0 {
          dict[char] = count - 1
        } else {
          return false
        }
      }
      
      return true
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let s = testCase.0.0
        let t = testCase.0.1
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("s = \(s), t = \(t)")
        print("Result = ", solve(s, t))
        print("Expected = ", expected)
      }
    }
  }
}
