//
//  IntegerToRomanTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-30.
//

import XCTest
@testable import AlgorithmSwift

final class IntegerToRomanTest: XCTestCase {
  
  func testMath() throws {
    IntegerToRoman.testCases.forEach { input, expected in
      XCTAssertEqual(IntegerToRoman.Math.solve(input), expected)
    }
  }
}
