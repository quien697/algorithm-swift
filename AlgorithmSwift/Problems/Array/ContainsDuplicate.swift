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
enum ContainsDuplicate: String {
  case name = "Contains Duplicate"
  
  static let testCases: [([Int], Bool)] = [
    ([1,2,3,1], true),
    ([1,2,3,4], false),
    ([1,1,1,3,3,4,3,2,4,2], true)
  ]
  
  static func printResult(_  approach: String, _ solve: ([Int]) -> Bool) {
    print("=== \(RotateArray.name.rawValue) (\(approach)) ===");
    
    for (index, testCase) in testCases.enumerated() {
      let nums = testCase.0
      let expected = testCase.1
      print("\nCase \(index + 1):")
      print("Nums = \(nums)")
      print("Result = ", solve(nums))
      print("expected = ", expected)
    }
  }
  
  /**
   *
   * Approach: Brute Force
   * Time: O(N x N)
   * Space: O(1)
   *
   */
  enum BruteForce {
    
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
    
    static func run () {
      printResult(Approach.BruteForce.rawValue, solve)
    }
  }
  
  /**
   *
   * Approach: Hash Table
   * Time: O(N)
   * Space: O(N)
   *
   */
  enum HashTable {
    
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
    
    static func run () {
      printResult(Approach.HashTable.rawValue, solve)
    }
  }
}
