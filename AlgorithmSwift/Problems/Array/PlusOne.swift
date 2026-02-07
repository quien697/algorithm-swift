//
//  PlusOne.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-17.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 66. Plus One
 * https://leetcode.com/problems/plus-one
 *
 **/
enum PlusOne: ProblemProtocol {
  static let name: String = "Plus One"
  static let domain: Domain = .Array
  static let testCases: [([Int], [Int])] = [
    ([1,2,3], [1,2,4]),
    ([4,3,2,1], [4,3,2,2]),
    ([9], [1,0])
  ]
  
  /**
   *
   * Approach: Math
   * Time: O(N)
   * Space: O(N)
   *
   */
  enum Math: ApproachProtocol {
    static let approaches: [Approach] = [
      .Math,
    ]
    
    static func solve(_ digits: [Int]) -> [Int] {
      var digits = digits
      
      for i in (0..<digits.count).reversed() {
        if digits[i] < 9 {
          digits[i] += 1
          return digits
        }
        
        digits[i] = 0
      }
      
      digits.insert(1, at: 0)
      return digits
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "digits = \(input)"
        }
      )
    }
  }
}
