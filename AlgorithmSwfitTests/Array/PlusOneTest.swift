//
//  PlusOneTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-17.
//

import XCTest
@testable import AlgorithmSwift

final class PlusOneTest: XCTestCase {
  
  func testMath() throws {
    PlusOne.testCases.forEach { input, expected in
      XCTAssertEqual(PlusOne.Math.solve(input), expected)
    }
  }
}
