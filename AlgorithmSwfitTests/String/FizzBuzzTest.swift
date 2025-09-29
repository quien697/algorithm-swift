//
//  FizzBuzzTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-29.
//

import XCTest
@testable import AlgorithmSwift

final class FizzBuzzTest: XCTestCase {
  
  func testMath() throws {
    FizzBuzz.testCases.forEach { input, expected in
      XCTAssertEqual(FizzBuzz.Math.solve(input), expected)
    }
  }
}
