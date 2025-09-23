//
//  ValidPalindrome.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-23.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 125. Valid Palindrome
 * https://leetcode.com/problems/valid-palindrome
 *
 **/
enum ValidPalindrome: ProblemProtocol {
  static let name: String = "Valid Palindrome"
  static let domain: Domain = .String
  static let testCases: [(String, Bool)] = [
    ("A man, a plan, a canal: Panama", true),
    ("race a car", false),
    (" ", true),
  ]
  
  /**
   *
   * Approach: Two Pointers (Left-Right)
   * Time: O(N)
   * Space: O(1)
   *
   */
  enum TwoPointers: ApproachProtocol {
    static let approaches: [Approach] = [
      .TwoPointers,
      .LeftRight,
    ]
    
    static func solve(_ s: String) -> Bool {
      var left = s.startIndex
      var right = s.index(before: s.endIndex)
      
      while left < right {
        let leftChar = s[left]
        let rightChar = s[right]
        
        if !(leftChar.isNumber || leftChar.isLetter) {
          left = s.index(after: left)
          continue
        }
        
        if !(rightChar.isNumber || rightChar.isLetter) {
          right = s.index(before: right)
          continue
        }
        
        if (leftChar.lowercased() != rightChar.lowercased()) {
          return false
        }
        
        left = s.index(after: left)
        right = s.index(before: right)
      }
      
      return true
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let s = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("s = \(s)")
        print("Result = ", solve(s))
        print("Expected = ", expected)
      }
    }
  }
  
  /**
   *
   * Approach: Reverse
   * Time: O(N)
   * Space: O(N)
   *
   */
  enum Reverse: ApproachProtocol {
    static let approaches: [Approach] = [
      .Reverse,
    ]
    
    static func solve(_ s: String) -> Bool {
      let s = s.lowercased().filter { $0.isLetter || $0.isNumber }
      return s == String(s.reversed())
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let s = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("s = \(s)")
        print("Result = ", solve(s))
        print("Expected = ", expected)
      }
    }
  }
}
