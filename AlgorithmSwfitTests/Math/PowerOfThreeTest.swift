//
//  PowerOfThreeTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-29.
//

import XCTest
@testable import AlgorithmSwift

final class PowerOfThreeTest: XCTestCase {
  
  func testMath() throws {
    PowerOfThree.testCases.forEach { input, expected in
      XCTAssertEqual(PowerOfThree.Math.solve(input), expected)
    }
  }
}
