//
//  ContainsDuplicate.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-13.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 217. Contains Duplicate
 * https://leetcode.com/problems/contains-duplicate
 *
 **/
enum ContainsDuplicate: ProblemProtocol {
  static let name: String = "Contains Duplicate"
  static let domain: Domain = .Array
  static let testCases: [([Int], Bool)] = [
    ([1,2,3,1], true),
    ([1,2,3,4], false),
    ([1,1,1,3,3,4,3,2,4,2], true)
  ]
  
  /**
   *
   * Approaches: Brute Force
   * Time: O(N x N)
   * Space: O(1)
   *
   */
  enum BruteForce: ApproachProtocol {
    static let approaches: [Approach] = [
      .BruteForce,
    ]
    
    static func solve(_ nums: [Int]) -> Bool {
      guard nums.count > 1 else { return false }
      
      let count = nums.count
      
      for i in 0..<count {
        for j in 0..<count {
          if i != j && nums[i] == nums[j] {
            return true
          }
        }
      }
      return false
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "Nums = \(input)"
        }
      )
    }
  }
  
  /**
   *
   * Approaches: Hash Table (Set)
   * Time: O(N)
   * Space: O(N)
   *
   */
  enum HashTable: ApproachProtocol {
    static let approaches: [Approach] = [
      .HashTable,
      .Set,
    ]
    
    static func solve(_ nums: [Int]) -> Bool {
      guard nums.count > 1 else { return false }
      
      var numsSet: Set<Int> = []
      
      for num in nums {
        if numsSet.contains(num) {
          return true
        } else {
          numsSet.insert(num)
        }
      }
      
      return false
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "Nums = \(input)"
        }
      )
    }
  }
}
