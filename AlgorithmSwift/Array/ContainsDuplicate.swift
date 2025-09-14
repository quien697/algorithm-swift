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
enum ContainsDuplicate {
  
  enum BruteForce {
    
    /**
     *
     * Approach: Brute Force
     * Time: O(N x N)
     * Space: O(1)
     *
     */
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
      print("=== Contains Duplicate (Brute Force) ===");
      
      let nums1: [Int] = [1, 2, 3, 1]
      print("\nCase 1:")
      print("Nums = \(nums1)")
      print("Result = ",  solve(nums1))
      
      let nums2: [Int] = [1, 2, 3, 4]
      print("\nCase 2:")
      print("Nums = \(nums2)")
      print("Result = ",  solve(nums2))
      
      let nums3: [Int] = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
      print("\nCase 3:")
      print("Nums = \(nums3)")
      print("Result = ",  solve(nums3))
    }
  }
  
  enum HashTable {
    
    /**
     *
     * Approach: Hash Table
     * Time: O(N)
     * Space: O(N)
     *
     */
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
      print("=== Contains Duplicate (Hash Table) ===");
      
      let nums1: [Int] = [1, 2, 3, 1]
      print("\nCase 1:")
      print("Nums = \(nums1)")
      print("Result = ",  solve(nums1))
      
      let nums2: [Int] = [1, 2, 3, 4]
      print("\nCase 2:")
      print("Nums = \(nums2)")
      print("Result = ",  solve(nums2))
      
      let nums3: [Int] = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
      print("\nCase 3:")
      print("Nums = \(nums3)")
      print("Result = ",  solve(nums3))
    }
  }
}
