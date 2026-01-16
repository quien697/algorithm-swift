//
//  ValidParenthesesTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-16.
//

import XCTest
@testable import AlgorithmSwift

final class ValidParenthesesTest: XCTestCase {
  
  func testTwoPointers() throws {
    ValidParentheses.testCases.forEach { input, expected in
      XCTAssertEqual(ValidParentheses.Stack.solve(input), expected)
    }
  }
}
