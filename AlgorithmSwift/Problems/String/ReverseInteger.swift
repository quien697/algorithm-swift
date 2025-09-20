//
//  ReverseInteger.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-20.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 7. Reverse Integer
 * https://leetcode.com/problems/reverse-integer
 *
 **/
enum ReverseInteger: ProblemProtocol {
  static let name: String = "Reverse Integer"
  static let domain: Domain = .String
  static let testCases: [(Int, Int)] = [
    (123, 321),
    (-123, -321),
    (120, 21),
  ]
  
  /**
   *
   * Approach: Math
   * Time: O(Log N)
   * Space: O(1)
   *
   */
  enum Math: ApproachProtocol {
    static let approaches: [Approach] = [
      .Math
    ]
    
    static func solve(_ x: Int) -> Int {
      var num = x, result = 0
      
      while num != 0 {
        result = result * 10 + (num % 10)
        num /= 10
      }
      
      return Int32.min > result || Int32.max < result ? 0 : result
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let x = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("x = \(x)")
        print("Result = ", solve(x))
        print("Expected = ", expected)
      }
    }
  }
}
