//
//  LongestPalindromicSubstringTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-16.
//

import XCTest
@testable import AlgorithmSwift

final class LongestPalindromicSubstringTest: XCTestCase {
  
  func testDPBottomUp() throws {
    LongestPalindromicSubstring.testCases.forEach { input, expected in
      let result = LongestPalindromicSubstring.DPBottomUp.solve(input)
      XCTAssertTrue(expected.contains(result), expected.joined(separator: " | "))
    }
  }
  
  func testExpandAroundCenter() throws {
    LongestPalindromicSubstring.testCases.forEach { input, expected in
      let result = LongestPalindromicSubstring.ExpandAroundCenter.solve(input)
      XCTAssertTrue(expected.contains(result), expected.joined(separator: " | "))
    }
  }
}
