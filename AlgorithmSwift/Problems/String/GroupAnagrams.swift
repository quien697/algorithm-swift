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
   * Approach: Hash Table + Sorting
   * Time: O(N x K Log K)
   * Space: O(N x K)
   *  - N = number of strings (like, str.scount)
   *  - K = average length of each string (like, str[0].count)
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
