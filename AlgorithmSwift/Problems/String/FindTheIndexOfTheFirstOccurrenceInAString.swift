//
//  FindTheIndexOfTheFirstOccurrenceInAString.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-24.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 28. Find the Index of the First Occurrence in a String
 * https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string
 *
 **/
enum FindTheIndexOfTheFirstOccurrenceInAString: ProblemProtocol {
  static let name: String = "Find the Index of the First Occurrence in a String"
  static let domain: Domain = .String
  static let testCases: [((String, String), Int)] = [
    (("sadbutsad", "sad"), 0),
    (("leetcode", "leeto"), -1),
    (("It's aa pencil", "a pen"), 6),
  ]
  
  /**
   *
   * Approach: Brute Force Substring Search (Sliding Window)
   * Time: O(N x M)
   * Space: O(1)
   *
   */
  enum BruteForceSubstringSearchStringIndex: ApproachProtocol {
    static let approaches: [Approach] = [
      .BruteForceSubstringSearch,
      .SlidingWindow
    ]
    
    static func solve(_ haystack: String, _ needle: String) -> Int {
      let nCount = needle.count
      let hCount = haystack.count
      guard hCount >= nCount else { return -1 }
      
      let hStartIndex = haystack.startIndex
      let hEndIndex = haystack.index(hStartIndex, offsetBy: hCount - nCount)
      var index = hStartIndex
      
      while index <= hEndIndex {
        let endIndex = haystack.index(index, offsetBy: nCount - 1)
        
        if haystack[index...endIndex] == needle {
          return haystack.distance(from: hStartIndex, to: index)
        }
        
        index = haystack.index(after: index)
      }
      
      return -1
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "haystack = \(input.0), needle = \(input.1)"
        }
      )
    }
  }
  
  /**
   *
   * Approach: Brute Force Substring Search (Sliding Window)
   * Time: O(N x M)
   * Space: O(1)
   *
   */
  enum BruteForceSubstringSearchArrayIndex: ApproachProtocol {
    static let approaches: [Approach] = [
      .BruteForceSubstringSearch,
      .SlidingWindow
    ]
    
    static func solve(_ haystack: String, _ needle: String) -> Int {
      let haystack = Array(haystack)
      let needle = Array(needle)
      let n = haystack.count
      let m = needle.count
      
      guard n >= m else { return -1 }
      
      for i in 0...(n - m) {
        var j = 0
        
        while j < m && haystack[i + j] == needle[j] {
          j += 1
        }
        
        if j == m {
          return i
        }
      }
      return -1
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "haystack = \(input.0), needle = \(input.1)"
        }
      )
    }
  }
}
