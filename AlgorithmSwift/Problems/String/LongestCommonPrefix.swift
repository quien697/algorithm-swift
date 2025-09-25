//
//  LongestCommonPrefix.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-25.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 14. Longest Common Prefix
 * https://leetcode.com/problems/longest-common-prefix
 *
 **/
enum LongestCommonPrefix: ProblemProtocol {
  static let name: String = "Longest Common Prefix"
  static let domain: Domain = .String
  static let testCases: [([String], String)] = [
    (["flower","flow","flight"], "fl"),
    (["dog","racecar","car"], ""),
  ]
  
  /**
   *
   * Approach: String (Prefix)
   * Time: O(N x M)
   * Space: O(1)
   *
   */
  enum StringTraversal: ApproachProtocol {
    static let approaches: [Approach] = [
      .StringTraversal,
      .Prefix,
    ]
    
    static func solve(_ strs: [String]) -> String {
      guard !strs.isEmpty else { return "" }
      
      var result = strs[0]
      
      for str in strs {
        while !str.hasPrefix(result) {
          result = String(result.dropLast())
        }
      }
      
      return result
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let strs = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("strs = \(strs)")
        print("Result = ", solve(strs))
        print("Expected = ", expected)
      }
    }
  }
}
