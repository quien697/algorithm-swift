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
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "strs = \(input)"
        }
      )
    }
  }
}
