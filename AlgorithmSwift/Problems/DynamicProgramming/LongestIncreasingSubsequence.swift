//
//  LongestIncreasingSubsequence.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-29.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 300. Longest Increasing Subsequence
 * https://leetcode.com/problems/longest-increasing-subsequence
 *
 **/
enum LongestIncreasingSubsequence: ProblemProtocol {
  static let name: String = "Longest Increasing Subsequence"
  static let domain: Domain = .DynamicProgramming
  static let testCases: [([Int], Int)] = [
    ([10,9,2,5,3,7,101,18], 4),
    ([0,1,0,3,2,3], 4),
    ([7,7,7,7,7,7,7], 1),
    ([1,3,6,7,9,4,10,5,6], 6)
  ]
  
  /**
   *
   * Approach: Dynamic Programming (Bottom Up)
   * Time: O(N x N)
   * Space: O(N)
   *
   * Relation: dp[i] = max(dp[i], dp[j] + 1) where nums[i] > nums[j], i > j >= 0
   *
   */
  enum DPBottomUp: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BottomUp,
    ]
    
    static func solve(_ nums: [Int]) -> Int {
      let n = nums.count
      var dp = [Int](repeating: 1, count: n)
      var result = 1
      
      for i in 1..<n {
        for j in 0..<i where nums[i] > nums[j] {
          dp[i] = max(dp[i], dp[j] + 1)
        }
        result = max(result, dp[i])
      }
      
      return result
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let nums = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("nums = \(nums)")
        print("Result = ", solve(nums))
        print("Expected = ", expected)
      }
    }
  }
  
  /**
   *
   * Approach: Dynamic Programming (Linear Search)
   * Time: O(N x N)
   * Space: O(N)
   *
   */
  enum DPLinearSearch: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .LinearSearch,
      .Greedy,
    ]
    
    static func solve(_ nums: [Int]) -> Int {
      var dp = [Int]()
      
      for num in nums {
        if let index = dp.firstIndex(where: { $0 >= num }) {
          dp[index] = num
        } else {
          dp.append(num)
        }
        print(dp)
      }
      
      return dp.count
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let nums = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("nums = \(nums)")
        print("Result = ", solve(nums))
        print("Expected = ", expected)
      }
    }
  }
  
  /**
   *
   * Approach: Dynamic Programming (BinarySearch + Greedy)
   * Time: O(N x LogN)
   * Space: O(N)
   *
   */
  enum DPBinarySearch: ApproachProtocol {
    static let approaches: [Approach] = [
      .DynamicProgramming,
      .BinarySearch,
      .Greedy,
    ]
    
    static func solve(_ nums: [Int]) -> Int {
      var dp = [Int]()
      
      for num in nums {
        if let index = helper(in: dp, for: num) {
          dp[index] = num
        } else {
          dp.append(num)
        }
      }
      
      return dp.count
    }
    
    static func helper(in collection: [Int], for target: Int) -> Int? {
      var lower = 0
      var upper = collection.count
      
      while lower < upper {
        let mid = lower + (upper - lower) / 2
        let value = collection[mid]
        
        if value < target {
          lower = mid + 1
        } else {
          upper = mid
        }
      }
      
      return lower == collection.count ? nil : lower
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let nums = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("nums = \(nums)")
        print("Result = ", solve(nums))
        print("Expected = ", expected)
      }
    }
  }
}
