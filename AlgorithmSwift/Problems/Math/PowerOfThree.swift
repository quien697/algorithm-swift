//
//  PowerOfThree.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-29.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 326. Power of Three
 * https://leetcode.com/problems/power-of-three
 *
 **/
enum PowerOfThree: ProblemProtocol {
  static let name: String = "Power of Three"
  static let domain: Domain = .Math
  static let testCases: [(Int, Bool)] = [
    (27, true),
    (0, false),
    (-1, false),
  ]
  
  /**
   *
   * Approach: Math
   * Time: O(N)
   * Space: O(N)
   *
   */
  enum Math : ApproachProtocol {
    static let approaches: [Approach] = [
      .Math,
    ]
    
    static func solve(_ n: Int) -> Bool {
      guard n != 0 else { return false }
      
      var n = n
      
      while n % 3 == 0 {
        n /= 3
      }
      
      return n == 1
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let n = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("n = \(n)")
        print("Result = ", solve(n))
        print("Expected = ", expected)
      }
    }
  }
}
