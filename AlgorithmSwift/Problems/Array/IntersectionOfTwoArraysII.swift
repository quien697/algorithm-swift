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
enum IntersectionOfTwoArraysII: ProblemProtocol {
  static let name: String = "Intersection of Two Arrays II"
  static let domain: Domain = .Array
  static let testCases: [(([Int], [Int]), [Int])] = [
    (([1,2,2,1], [2,2]), [2,2]),
    (([4,9,5], [9,4,9,8,4]), [4,9]),
  ]
  
  /**
   *
   * Approach: Sorting + Two Pointers
   * Time: O(N log N + M log M)
   * Space: O(N + M)
   *
   */
  enum SortingTwoPointers: ApproachProtocol {
    static let approaches: [Approach] = [
      .Sorting,
      .TwoPointers,
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
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "Nums1 = \(input.0), Nums2 = \(input.1)"
        }
      )
      
    }
  }
  
  /**
   *
   * Approach: Hash Table (Dictionary)
   * Time: O(N + M)
   * Space: O(min(N, M))
   *
   */
  enum HashTable: ApproachProtocol {
    static let approaches: [Approach] = [
      .HashTable,
      .Dictionary,
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
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "Nums1 = \(input.0), Nums2 = \(input.1)"
        }
      )
    }
  }
}
