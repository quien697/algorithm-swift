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
enum RotateArray {
  
  enum BruteForce {
    
    /**
     * Approach: Brute Force
     * Time: O(N * K)
     * Space: O(1)
     */
    static func solve(_ nums: inout [Int], _ k: Int) -> [Int] {
      guard k > 0 else { return nums }
      
      for _ in 1...k {
        nums.insert(nums[nums.count - 1], at: 0)
        nums.removeLast()
      }
      return nums
    }
    
    static func run () {
      print("=== Rotate Array (Brute Force) ===");
      
      var nums1 = [1,2,3,4,5,6,7], k1 = 3
      print("\nCase 1:")
      print("Nums = \(nums1)")
      print("Result = \(solve(&nums1, k1))")
      
      var nums2 = [-1,-100,3,99], k2 = 2
      print("\nCase 2:")
      print("Prices = \(nums2)")
      print("Result = \(solve(&nums2, k2))")
    }
  }
  
  enum Reverse {
    
    /**
     * Approach: Reverse
     * Time: O(N)
     * Space: O(1)
     */
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
      print("=== Rotate Array (Reverse) ===");
      
      var nums1 = [1,2,3,4,5,6,7], k1 = 3
      print("\nCase 1:")
      print("Nums = \(nums1)")
      print("Result = \(solve(&nums1, k1))")
      
      var nums2 = [-1,-100,3,99], k2 = 2
      print("\nCase 2:")
      print("Prices = \(nums2)")
      print("Result = \(solve(&nums2, k2))")
    }
  }
}
