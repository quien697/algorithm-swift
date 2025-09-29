//
//  StringToIntegerATOI.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-24.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 8. String to Integer (atoi)
 * https://leetcode.com/problems/string-to-integer-atoi
 *
 **/
enum StringToIntegerATOI: ProblemProtocol {
  static let name: String = "String to Integer (atoi)"
  static let domain: Domain = .String
  static let testCases: [(String, Int)] = [
    ("42", 42),
    (" -42", -42),
    ("1337c0d3", 1337),
    ("0-1", 0),
    ("words and 987", 0),
  ]
  
  /**
   *
   * Approach: String Traversal
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum StringTraversal : ApproachProtocol {
    static let approaches: [Approach] = [
      .StringTraversal,
      .Math
    ]
    
    static func solve(_ s: String) -> Int {
      let s = s.trimmingCharacters(in: .whitespaces)
      guard !s.isEmpty else { return 0 }
      
      let intMax = Int(Int32.max)
      let intMin = Int(Int32.min)
      var sign = 1
      var index = s.startIndex
      var result = 0
      
      if s.first == "+" {
        index = s.index(after: index)
      }
      
      if s.first == "-" {
        index = s.index(after: index)
        sign = -1
      }
      
      while index < s.endIndex, let digit = s[index].wholeNumberValue {
        if result > ((intMax - digit) / 10) {
          return sign == 1 ? intMax : intMin
        }
        
        result = result * 10 + digit
        index = s.index(after: index)
      }
      
      return result * sign
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let s = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("s = \(s)")
        print("Result = ", solve(s))
        print("Expected = ", expected)
      }
    }
  }
}
