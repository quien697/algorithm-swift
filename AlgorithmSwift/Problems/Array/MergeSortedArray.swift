//
//  MergeSortedArray.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-26.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 88. Merge Sorted Array
 * https://leetcode.com/problems/merge-sorted-array
 *
 **/
enum MergeSortedArray: ProblemProtocol {
  static let name: String = "Merge Sorted Array"
  static let domain: Domain = .Array
  static let testCases: [(([Int], Int, [Int], Int), [Int])] = [
    (([1,2,3,0,0,0], 3, [2,5,6], 3), [1,2,2,3,5,6]),
    (([1], 1, [], 0), [1]),
    (([0], 0, [1], 1), [1]),
  ]
  
  /**
   *
   * Approach: Two Pointers (Left-Right)
   * Time: O(N + M)
   * Space: O(1)
   *
   */
  enum TwoPointers: ApproachProtocol {
    static let approaches: [Approach] = [
      .TwoPointers,
      .LeftRight,
    ]
    
    static func solve(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) -> [Int] {
      var leftIndex = m - 1, rightIndex = n - 1
      var mergedIndex = m + n - 1
      
      while leftIndex >= 0 || rightIndex >= 0 {
        if leftIndex >= 0 && (rightIndex < 0 || nums1[leftIndex] > nums2[rightIndex]) {
          nums1[mergedIndex] = nums1[leftIndex]
          leftIndex -= 1
        } else {
          nums1[mergedIndex] = nums2[rightIndex]
          rightIndex -= 1
        }
        
        mergedIndex -= 1
      }
      
      return nums1
    }
    
    static func run () {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        var nums1 = testCase.0.0
        let m = testCase.0.1
        let nums2 = testCase.0.2
        let n = testCase.0.3
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("Nums1 = \(nums1), m = \(m)")
        print("Nums2 = \(nums2), n = \(n)")
        print("Result = ", solve(&nums1, m, nums2, n))
        print("Expected = ", expected)
      }
    }
  }
}
