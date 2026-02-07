//
//  FizzBuzz.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-29.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 412. Fizz Buzz
 * https://leetcode.com/problems/fizz-buzz
 *
 **/
enum FizzBuzz: ProblemProtocol {
  static let name: String = "Fizz Buzz"
  static let domain: Domain = .String
  static let testCases: [(Int, [String])] = [
    (3, ["1","2","Fizz"]),
    (5, ["1","2","Fizz","4","Buzz"]),
    (15, ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"])
  ]
  
  /**
   *
   * Approach: Math
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum Math: ApproachProtocol {
    static let approaches: [Approach] = [
      .Math,
    ]
    
    static func solve(_ n: Int) -> [String] {
      var result: [String] = []
      
      for i in 1...n {
        switch (i.isMultiple(of: 3), i.isMultiple(of: 5)) {
        case (true, true):
          result.append("FizzBuzz")
        case (true, false):
          result.append("Fizz")
        case (false, true):
          result.append("Buzz")
        case (false, false):
          result.append(String(i))
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
          "n = \(input)"
        }
      )
    }
  }
}
