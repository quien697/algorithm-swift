//
//  GroupAnagrams.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-09.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 49. Group Anagrams
 * https://leetcode.com/problems/group-anagrams
 *
 **/
enum GroupAnagrams: ProblemProtocol {
  static let name: String = "Group Anagrams"
  static let domain: Domain = .String
  static let testCases: [([String], [[String]])] = [
    (
      ["eat","tea","tan","ate","nat","bat"],
      [["bat"],["nat","tan"],["ate","eat","tea"]]
    ),
    (
      [""],
      [[""]]
    ),
    (
      ["a"],
      [["a"]]
    )
  ]
  
  /**
   *
   * Approach: String (Prefix)
   * Time: O(N x M)
   * Space: O(1)
   *
   */
  enum HashTable: ApproachProtocol {
    static let approaches: [Approach] = [
      .HashTable,
      .Dictionary,
      .Sorting,
    ]
    
    static func solve(_ strs: [String]) -> [[String]] {
      var dict = [String: [String]]()
      
      for str in strs {
        let sortedStart = String(str.sorted())
        dict[sortedStart, default: []].append(str)
      }
      
      return Array(dict.values)
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "strs = \(input)"
        }
      )
    }
  }
}
