//
//  ValidParentheses.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-13.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 20. Valid Parentheses
 * https://leetcode.com/problems/valid-parentheses
 *
 **/
enum ValidParentheses: ProblemProtocol {
  static let name: String = "Valid Parentheses"
  static let domain: Domain = .String
  static let testCases: [(String, Bool)] = [
    ("()", true),
    ("()[]{}", true),
    ("(]", false),
    ("([])", true),
    ("([)]", false),
  ]
  
  /**
   *
   * Approach: Stack (LIFO)
   * Time: O(N)
   * Space: O(N)
   *
   */
  enum Stack: ApproachProtocol {
    static let approaches: [Approach] = [
      .Stack,
    ]
    
    static func solve(_ s: String) -> Bool {
      let pairedBrackets: [Character: Character] = [")": "(", "]": "[", "}": "{"]
      var stack = [Character]()
      
      for char in s {
        if let openBracket = pairedBrackets[char] {
          guard stack.popLast() == openBracket else { return false }
        } else {
          stack.append(char)
        }
      }
      
      return stack.isEmpty
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
