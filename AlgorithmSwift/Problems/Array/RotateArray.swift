//
//  RotateArray.swift
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
enum RotateArray: ProblemProtocol {
  static let name: String = "Rotate Array"
  static let domain: Domain = .Array
  static let testCases: [(([Int], Int), [Int])] = [
    (([1,2,3,4,5,6,7], 3), [5,6,7,1,2,3,4]),
    (([-1,-100,3,99], 2), [3,99,-1,-100])
  ]
  
  /**
   *
   * Approach: Brute Force
   * Time: O(N x K)
   * Space: O(1)
   *
   */
  enum BruteForce: ApproachProtocol {
    static let approaches: [Approach] = [
      .BruteForce,
    ]
    
    static func solve(_ nums: inout [Int], _ k: Int) -> [Int] {
      guard k > 0 else { return nums }
      
      for _ in 1...k {
        nums.insert(nums[nums.count - 1], at: 0)
        nums.removeLast()
      }
      return nums
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: { (input: ([Int], Int)) -> [Int] in
          var nums = input.0
          let k = input.1
          return solve(&nums, k)
        },
        inputDescription: { input in
          "Nums = \(input.0), k = \(input.1)"
        }
      )
    }
  }
  
  /**
   *
   * Approach: Reverse
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum Reverse: ApproachProtocol {
    static let approaches: [Approach] = [
      .Reverse,
    ]
    
    static func solve(_ nums: inout [Int], _ k: Int) -> [Int] {
      guard k > 0 else { return nums }
      
      let count = nums.count
      let k = k % count
      nums.reverse()
      nums[0..<k].reverse()
      nums[k..<count].reverse()
      return nums
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: { (input: ([Int], Int)) -> [Int] in
          var nums = input.0
          let k = input.1
          return solve(&nums, k)
        },
        inputDescription: { input in
          "Nums = \(input.0), k = \(input.1)"
        }
      )
    }
  }
}
