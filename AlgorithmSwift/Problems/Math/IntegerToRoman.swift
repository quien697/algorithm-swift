//
//  IntegerToRoman.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-30.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 12. Integer to Roman
 * https://leetcode.com/problems/integer-to-roman
 *
 **/
enum IntegerToRoman: ProblemProtocol {
  static let name: String = "Integer to Roman"
  static let domain: Domain = .Math
  static let testCases: [(Int, String)] = [
    (3749, "MMMDCCXLIX"),
    (58, "LVIII"),
    (1994, "MCMXCIV"),
  ]
  
  /**
   *
   * Approach: Math + Hash Table + Greedy
   * Time: O(1)
   * Space: O(1)
   *
   */
  enum Math: ApproachProtocol {
    static let approaches: [Approach] = [
      .Math,
      .HashTable,
      .Greedy
    ]
    
    static func solve(_ num: Int) -> String {
      let dict: [Int: String] = [
        1: "I",
        5: "V",
        10: "X",
        50: "L",
        100: "C",
        500: "D",
        1000: "M",
      ]
      var num = num
      var result: String = ""
      
      for position in stride(from: 3, through: 0, by: -1) {
        let value = Int(pow(10, Double(position)))
        let digit = num / value
        num = num % value
        
        switch digit {
        case 9:
          result += dict[value]! + dict[value * 10]!
        case 5...8:
          result += dict[value * 5]!
          result += String(repeating: dict[value]!, count: digit - 5)
        case 4:
          result += dict[value]! + dict[value * 5]!
        case 1...3:
          result += String(repeating: dict[value]!, count: digit)
        default:
          break
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
          "num = \(input)"
        }
      )
    }
  }
}
