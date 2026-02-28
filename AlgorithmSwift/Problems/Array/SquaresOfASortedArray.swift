//
//  SquaresOfASortedArray.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-28.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 977. Squares of a Sorted Array
 * https://leetcode.com/problems/squares-of-a-sorted-array
 *
 **/
enum SquaresOfASortedArray: ProblemProtocol {
  static let name: String = "Squares of a Sorted Array"
  static let domain: Domain = .Array
  static let testCases: [([Int], [Int])] = [
    ([-4,-1,0,3,10], [0,1,9,16,100]),
    ([-7,-3,2,3,11], [4,9,9,49,121])
  ]
  
  /**
   *
   * Approach: Two Pointers
   * Time: O(N)
   * Space: O(N)
   *
   */
  enum TwoPointers: ApproachProtocol {
    static let approaches: [Approach] = [
      .TwoPointers
    ]
    
    static func solve(_ nums: [Int]) -> [Int] {
      let n = nums.count
      var left = 0
      var right = n - 1
      var index = n - 1
      var result = [Int](repeating: 0, count: n)
      
      while left <= right {
        let leftSquare = nums[left] * nums[left]
        let rightSquare = nums[right] * nums[right]
        
        if leftSquare <= rightSquare {
          result[index] = rightSquare
          right -= 1
        } else {
          result[index] = leftSquare
          left += 1
        }
        
        index -= 1
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
          "nums = \(input)"
        }
      )
    }
  }
}
