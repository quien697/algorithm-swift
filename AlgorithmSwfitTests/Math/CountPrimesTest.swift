//
//  CountPrimesTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-29.
//

import XCTest
@testable import AlgorithmSwift

final class CountPrimesTest: XCTestCase {
  
  func testMath() throws {
    CountPrimes.testCases.forEach { input, expected in
      XCTAssertEqual(CountPrimes.Math.solve(input), expected)
    }
  }
}
