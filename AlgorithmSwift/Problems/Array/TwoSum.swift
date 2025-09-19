//
//  TwoSum.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-18.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 1. Two Sum
 * https://leetcode.com/problems/two-sum
 *
 **/
enum TwoSum: ProblemProtocol {
  static let name: String = "Two Sum"
  static let domain: Domain = .Array
  static let testCases: [(([Int], Int), [Int])] = [
    (([2,7,11,15], 9), [0,1]),
    (([3,2,4], 6), [1,2]),
    (([3,3], 6), [0,1])
  ]
  
  /**
   *
   * Approach: Brute Force
   * Techniques:
   * Time: O(N ^ 2)
   * Space: O(1)
   *
   */
  enum BruteForce: ApproachProtocol {
    static let approaches: [Approach] = [
      .BruteForce,
    ]
    
    static func solve(_ nums: [Int], _ target: Int) -> [Int] {
      let n = nums.count
      
      for i in 0..<n-1 {
        for j in i+1..<n {
          if nums[i] + nums[j] == target {
            return [i, j]
          }
        }
      }
      
      return []
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let nums = testCase.0.0
        let target = testCase.0.1
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("Nums = \(nums), Target = \(target)")
        print("Result = ", solve(nums, target))
        print("Expected = ", expected)
      }
    }
  }
  
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
    
    static func solve(_ nums: [Int], _ target: Int) -> [Int] {
      var dict = [Int: Int]()
      
      for (index, num) in nums.enumerated() {
        if let d = dict[target - num] {
          return [d, index]
        }
        dict[num] = index
      }
      
      return []
    }
    
    static func run () {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let nums = testCase.0.0
        let target = testCase.0.1
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("Nums = \(nums), Target = \(target)")
        print("Result = ", solve(nums, target))
        print("Expected = ", expected)
      }
    }
  }
}
