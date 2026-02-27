//
//  FindNumbersWithEvenNumberOfDigits.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-27.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 1295. Find Numbers with Even Number of Digits
 * https://leetcode.com/problems/find-numbers-with-even-number-of-digits
 *
 **/
enum FindNumbersWithEvenNumberOfDigits: ProblemProtocol {
  static let name: String = "Find Numbers with Even Number of Digits"
  static let domain: Domain = .Array
  static let testCases: [([Int], Int)] = [
    ([12,345,2,6,7896], 2),
    ([555,901,482,1771], 1),
    ([100000], 1),
  ]
  
  /**
   *
   * Approach: Math + Linear Scan (One-Pass)
   * Time: O(n x k)
   * Space: O(1)
   * - k = number of digits per number
   *
   */
  enum LinearScan: ApproachProtocol {
    static let approaches: [Approach] = [
      .Math,
      .LinearScan,
      .OnePass,
    ]
    
    static func solve(_ nums: [Int]) -> Int {
      var result = 0
      
      for n in nums {
        var num = n
        var numDigits = 0
        
        while num > 0 {
          numDigits += 1
          num /= 10
        }
        
        if numDigits % 2 == 0 {
          result += 1
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
          "nums = \(input)"
        }
      )
      
    }
  }
}
