//
//  PlusOne.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-17.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 66. Plus One
 * https://leetcode.com/problems/plus-one
 *
 **/
enum PlusOne: String {
  case name = "Plus One"
  
  static let testCases: [([Int], [Int])] = [
    ([1,2,3], [1,2,4]),
    ([4,3,2,1], [4,3,2,2]),
    ([9], [1,0])
  ]
  
  /**
   *
   * Approach: Carry Propagation
   * Time: O(N)
   * Space: O(N)
   *
   */
  enum CarryPropagation: ApproachProtocol {
    static var techniques = [
      Technique.CarryPropagation.rawValue
    ]
    
    static func solve(_ digits: [Int]) -> [Int] {
      var digits = digits
      
      for i in (0..<digits.count).reversed() {
        if digits[i] < 9 {
          digits[i] += 1
          return digits
        }
        
        digits[i] = 0
      }
      
      digits.insert(1, at: 0)
      return digits
    }
    
    static func run () {
      print("=== \(PlusOne.name.rawValue) (\(techniques.joined(separator: " + "))) ===");
      
      for (index, testCase) in testCases.enumerated() {
        let digits = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("Digits = \(digits)")
        print("Result = ", solve(digits))
        print("expected = ", expected)
      }
    }
  }
}
