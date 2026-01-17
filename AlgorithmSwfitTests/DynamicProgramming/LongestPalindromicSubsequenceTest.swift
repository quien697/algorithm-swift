//
//  LongestPalindromicSubsequenceTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-18.
//

import XCTest
@testable import AlgorithmSwift

final class LongestPalindromicSubsequenceTest: XCTestCase {
  
  func testDPBottomUpLCS() throws {
    LongestPalindromicSubsequence.testCases.forEach { input, expected in
      XCTAssertEqual(LongestPalindromicSubsequence.DPBottomUpLCS.solve(input), expected)
    }
  }
  
  func testDPBottomUp() throws {
    LongestPalindromicSubsequence.testCases.forEach { input, expected in
      XCTAssertEqual(LongestPalindromicSubsequence.DPBottomUp.solve(input), expected)
    }
  }
}
