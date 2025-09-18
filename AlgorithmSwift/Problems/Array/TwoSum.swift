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
enum TwoSum: String{
  case name = "Two Sum"
  
  static let testCases: [(([Int], Int), [Int])] = [
    (([2,7,11,15], 9), [0,1]),
    (([3,2,4], 6), [1,2]),
    (([3,3], 6), [0,1])
  ]
  
  static func printResult(_  techniques: [String], _ solve: ([Int], Int) -> [Int]) {
    print("=== \(TwoSum.name.rawValue) (\(techniques.joined(separator: " + "))) ===");
    
    for (index, testCase) in testCases.enumerated() {
      let nums = testCase.0.0
      let target = testCase.0.1
      let expected = testCase.1
      print("\nCase \(index + 1):")
      print("Nums = \(nums), Target = \(target)")
      print("Result = ", solve(nums, target))
      print("expected = ", expected)
    }
  }
  
  /**
   *
   * Approach: Brute Force
   * Time: O(N ^ 2)
   * Space: O(1)
   *
   */
  enum BruteForce: ApproachProtocol {
    static var techniques = [
      Technique.BruteForce.rawValue
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
      printResult(techniques, solve)
    }
  }
  
  /**
   *
   * Approach: Hash Table
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum HashTable: ApproachProtocol {
    static var techniques = [
      Technique.HashTable.rawValue
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
      printResult(techniques, solve)
    }
  }
}
