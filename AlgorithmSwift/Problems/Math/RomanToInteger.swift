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
  enum Math: ApproachProtocol {
    static let approaches: [Approach] = [
      .Math,
      .HashTable,
      .Reverse,
    ]
    
    static func solve(_ s: String) -> Int {
      let dict: [Character: Int] = [
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
        curr = dict[char]!
        result += curr >= prev ? curr : -curr
        prev = curr
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
}
