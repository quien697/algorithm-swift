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
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "x = \(input)"
        }
      )
    }
  }
}
