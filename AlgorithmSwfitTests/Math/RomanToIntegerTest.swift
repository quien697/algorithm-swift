//
//  RomanToIntegerTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-30.
//

import XCTest
@testable import AlgorithmSwift

final class RomanToIntegerTest: XCTestCase {
  
  func testMath() throws {
    RomanToInteger.testCases.forEach { input, expected in
      XCTAssertEqual(RomanToInteger.Math.solve(input), expected)
    }
  }
}
