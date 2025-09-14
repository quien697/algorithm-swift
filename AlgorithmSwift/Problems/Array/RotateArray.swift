//
//  Rotate Array.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-12.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 189. Rotate Array
 * https://leetcode.com/problems/rotate-array
 *
 **/
enum RotateArray: String{
  case name = "Rotate Array"
  
  static let testCases: [(([Int], Int), [Int])] = [
    (([1,2,3,4,5,6,7], 3), [5,6,7,1,2,3,4]),
    (([-1,-100,3,99], 2), [3,99,-1,-100])
  ]
  
  static func printResult(_  approach: String, _ solve: (inout [Int], Int) -> [Int]) {
    print("=== \(RotateArray.name.rawValue) (\(approach)) ===");
    
    for (index, testCase) in testCases.enumerated() {
      var nums = testCase.0.0
      let k = testCase.0.1
      let expected = testCase.1
      print("\nCase \(index + 1):")
      print("Nums = \(nums)")
      print("Result = ", solve(&nums, k))
      print("expected = ", expected)
    }
  }
  
  /**
   *
   * Approach: Brute Force
   * Time: O(N x K)
   * Space: O(1)
   *
   */
  enum BruteForce {
    
    static func solve(_ nums: inout [Int], _ k: Int) -> [Int] {
      guard k > 0 else { return nums }
      
      for _ in 1...k {
        nums.insert(nums[nums.count - 1], at: 0)
        nums.removeLast()
      }
      return nums
    }
    
    static func run() {
      printResult(Approach.BruteForce.rawValue, solve)
    }
  }
  
  /**
   *
   * Approach: Reverse
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum Reverse {
    
    static func solve(_ nums: inout [Int], _ k: Int) -> [Int] {
      guard k > 0 else { return nums }
      
      let count = nums.count
      let k = k % count
      nums.reverse()
      nums[0..<k].reverse()
      nums[k..<count].reverse()
      return nums
    }
    
    static func run () {
      printResult(Approach.Reverse.rawValue, solve)
    }
  }
}
