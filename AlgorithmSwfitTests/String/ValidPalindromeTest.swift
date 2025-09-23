//
//  ValidPalindromeTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-23.
//

import XCTest
@testable import AlgorithmSwift

final class ValidPalindromeTest: XCTestCase {
  
  func testTwoPointers() throws {
    ValidPalindrome.testCases.forEach { input, expected in
      XCTAssertEqual(ValidPalindrome.TwoPointers.solve(input), expected)
    }
  }
  
  func testReverse() throws {
    ValidPalindrome.testCases.forEach { input, expected in
      XCTAssertEqual(ValidPalindrome.Reverse.solve(input), expected)
    }
  }
}
