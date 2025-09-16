//
//  IntersectionOfTwoArraysII.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-16.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 350. Intersection of Two Arrays II
 * https://leetcode.com/problems/intersection-of-two-arrays-ii
 *
 **/
enum IntersectionOfTwoArraysII: String {
  case name = "Intersection of Two Arrays II"
  
  static let testCases: [(([Int], [Int]), [Int])] = [
    (([1,2,2,1], [2,2]), [2,2]),
    (([4,9,5], [9,4,9,8,4]), [4,9]),
  ]
  
  static func printResult(_  techniques: [String], _ solve: ([Int], [Int]) -> [Int]) {
    print("=== \(IntersectionOfTwoArraysII.name.rawValue) (\(techniques.joined(separator: " + "))) ===");
    
    for (index, testCase) in testCases.enumerated() {
      let nums1 = testCase.0.0
      let nums2 = testCase.0.1
      let expected = testCase.1
      print("\nCase \(index + 1):")
      print("Nums1 = \(nums1), Nums2 = \(nums2)")
      print("Result = ", solve(nums1, nums2))
      print("expected = ", expected)
    }
  }
  
  /**
   *
   * Approach: Sorting + Two Pointer
   * Time: O(N log N + M log M)
   * Space: O(N + M)
   *
   */
  enum SortingTwoPointer {
    static let techniques = [
      Technique.Sorting.rawValue,
      Technique.TwoPointer.rawValue
    ]
    
    static func solve(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
      let sortedNums1: [Int] = nums1.sorted()
      let sortedNums2: [Int] = nums2.sorted()
      var result: [Int] = []
      var i1 = 0, i2 = 0
      
      while (i1 < nums1.count && i2 < nums2.count) {
        if sortedNums1[i1] == sortedNums2[i2] {
          result.append(sortedNums1[i1])
          i1 += 1
          i2 += 1
        } else if (sortedNums1[i1] > sortedNums2[i2]) {
          i2 += 1
        } else {
          i1 += 1
        }
      }
      
      return result
    }
    
    static func run () {
      printResult(techniques, solve)
    }
  }
  
  /**
   *
   * Approach: Hash Table
   * Time: O(N + M)
   * Space: O(min(N, M))
   *
   */
  enum HashTable {
    static var techniques = [
      Technique.HashTable.rawValue
    ]
    
    static func solve(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
      var dict: [Int: Int] = [:]
      var result: [Int] = []
      
      for num in nums1 {
        dict[num, default: 0] += 1
      }
      
      for num in nums2 {
        if let count = dict[num], count > 0 {
          result.append(num)
          dict[num] = count - 1
        }
      }
      
      return result
    }
    
    static func run () {
      printResult(techniques, solve)
    }
  }
}
