//
//  SingleNumber.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-14.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 136. Single Number
 * https://leetcode.com/problems/single-number
 *
 **/
enum SingleNumber {
  
  enum Bitwise {
    
    /**
     *
     * Approach: Bitwise Operation
     * Time: O(N)
     * Space: O(1)
     *
     */
    static func solve(_ nums: [Int]) -> Int {
      var result = 0
      
      for num in nums {
        result ^= num
      }
      
      return result
    }
    
    static func run () {
      print("=== SingleNumber (Bitwise Operation) ===");
      
      let nums1: [Int] = [2, 2, 1]
      print("\nCase 1:")
      print("Nums = \(nums1)")
      print("Result = ",  solve(nums1))
      
      let nums2: [Int] = [4, 1, 2, 1, 2]
      print("\nCase 2:")
      print("Nums = \(nums2)")
      print("Result = ",  solve(nums2))
      
      let nums3: [Int] = [1]
      print("\nCase 3:")
      print("Nums = \(nums3)")
      print("Result = ",  solve(nums3))
    }
  }
  
  enum Bitwise2 {
    
    /**
     *
     * Approach: Bitwise Operation
     * Time: O(N)
     * Space: O(1)
     *
     * The same approach as `Bitwise`, just condensed into a single line.
     *
     */
    static func solve(_ nums: [Int]) -> Int {
      return nums.reduce(0, ^)
    }
    
    static func run () {
      print("=== SingleNumber (Bitwise Operation) ===");
      
      let nums1: [Int] = [2, 2, 1]
      print("\nCase 1:")
      print("Nums = \(nums1)")
      print("Result = ",  solve(nums1))
      
      let nums2: [Int] = [4, 1, 2, 1, 2]
      print("\nCase 2:")
      print("Nums = \(nums2)")
      print("Result = ",  solve(nums2))
      
      let nums3: [Int] = [1]
      print("\nCase 3:")
      print("Nums = \(nums3)")
      print("Result = ",  solve(nums3))
    }
  }
}
