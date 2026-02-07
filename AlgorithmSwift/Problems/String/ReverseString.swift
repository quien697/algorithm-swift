//
//  ReverseString.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-20.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 344. Reverse String
 * https://leetcode.com/problems/reverse-string
 *
 **/
enum ReverseString: ProblemProtocol {
  static let name: String = "Reverse String"
  static let domain: Domain = .String
  static let testCases: [([Character], [Character])] = [
    (
      ["h","e","l","l","o"],
      ["o","l","l","e","h"]
    ),
    (
      ["H","a","n","n","a","h"],
      ["h","a","n","n","a","H"]
    ),
  ]
  
  /**
   *
   * Approach: Two Pointers (Swap)
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum TwoPointers: ApproachProtocol {
    static let approaches: [Approach] = [
      .TwoPointers,
      .Swap,
    ]
    
    static func solve(_ s: inout [Character]) -> [Character] {
      let n = s.count
      
      for i in 0..<n/2 {
        s.swapAt(i, n - 1 - i)
      }
      
      return s
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: { (input: [Character]) -> [Character] in
          var s = input
          return solve(&s)
        },
        inputDescription: { input in
          "s = \(input)"
        }
      )
    }
  }
}
