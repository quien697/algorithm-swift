//
//  NonDecreasingDigitsTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-17.
//

import XCTest
@testable import AlgorithmSwift

final class NonDecreasingDigitsTest: XCTestCase {
  
  func testDPBottomUp() throws {
    NonDecreasingDigits.testCases.forEach { input, expected in
      XCTAssertEqual(NonDecreasingDigits.DPBottomUp.solve(input), expected)
    }
  }
  
  func testDPSpaceOptimized() throws {
    NonDecreasingDigits.testCases.forEach { input, expected in
      XCTAssertEqual(NonDecreasingDigits.DPSpaceOptimized.solve(input), expected)
    }
  }
}
