//
//  ReverseIntegerTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-20.
//

import XCTest
@testable import AlgorithmSwift

final class ReverseIntegerTest: XCTestCase {
  
  func testMath() throws {
    ReverseInteger.testCases.forEach { input, expected in
      XCTAssertEqual(ReverseInteger.Math.solve(input), expected)
    }
  }
}
