//
//  FirstUniqueCharacterInAString.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-22.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 387. First Unique Character in a String
 * https://leetcode.com/problems/first-unique-character-in-a-string
 *
 **/
enum FirstUniqueCharacterInAString: ProblemProtocol {
  static let name: String = "First Unique Character in a String"
  static let domain: Domain = .String
  static let testCases: [(String, Int)] = [
    ("leetcode", 0),
    ("loveleetcode", 2),
    ("aabb", -1)
  ]
  
  /**
   *
   * Approach: Hash Table (Dictionary)
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum HashTable: ApproachProtocol {
    static let approaches: [Approach] = [
      .HashTable,
      .Dictionary,
    ]
    
    static func solve(_ s: String) -> Int {
      //      var dict = [Character: Int]()
      //
      //      s.forEach { c in
      //        dict[c, default: 0] += 1
      //      }
      //
      //      for (index, char) in s.enumerated() {
      //        if dict[char] == 1 {
      //          return index
      //        }
      //      }
      //
      //      return -1
      
      let dict = s.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
      
      for (index, char) in s.enumerated() where dict[char] == 1 {
        return index
      }
      
      return -1
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
