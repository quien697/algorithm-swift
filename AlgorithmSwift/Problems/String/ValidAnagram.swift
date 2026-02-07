//
//  ValidAnagram.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-22.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 242. Valid Anagram
 * https://leetcode.com/problems/valid-anagram
 *
 **/
enum ValidAnagram: ProblemProtocol {
  static let name: String = "Valid Anagram"
  static let domain: Domain = .String
  static let testCases: [((String, String), Bool)] = [
    (("anagram", "nagaram"), true),
    (("rat", "car"), false),
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
    
    static func solve(_ s: String, _ t: String) -> Bool {
      guard s.count == t.count else { return false }
      
      var dict = s.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
      
      for char in t {
        if let count = dict[char], count > 0 {
          dict[char] = count - 1
        } else {
          return false
        }
      }
      
      return true
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "s = \(input.0), t = \(input.1)"
        }
      )
    }
  }
  
  /**
   *
   * Approach: Sorting
   * Time: O(N LogN)
   * Space: O(1)
   *
   */
  enum Sorting: ApproachProtocol {
    static let approaches: [Approach] = [
      .Sorting,
    ]
    
    static func solve(_ s: String, _ t: String) -> Bool {
      return s.sorted() == t.sorted()
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "s = \(input.0), t = \(input.1)"
        }
      )
    }
  }
 }
