//
//  RomanToInteger.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-30.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 13. Roman to Integer
 * https://leetcode.com/problems/roman-to-integer
 *
 **/
enum RomanToInteger: ProblemProtocol {
  static let name: String = "Roman to Integer"
  static let domain: Domain = .Math
  static let testCases: [(String, Int)] = [
    ("III", 3),
    ("LVIII", 58),
    ("MCMXCIV", 1994),
  ]
  
  /**
   *
   * Approach: Math + Hash Table
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum Math : ApproachProtocol {
    static let approaches: [Approach] = [
      .Math,
      .HashTable,
      .Reverse,
    ]
    
    static func solve(_ s: String) -> Int {
      let map: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000,
      ]
      var curr = 0
      var prev = 0
      var result = 0
      
      for char in s.reversed() {
        curr = map[char]!
        result += curr >= prev ? curr : -curr
        prev = curr
      }
      
      return result
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
