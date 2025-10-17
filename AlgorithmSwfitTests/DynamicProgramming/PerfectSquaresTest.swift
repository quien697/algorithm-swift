//
//  PerfectSquaresTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-17.
//

import XCTest
@testable import AlgorithmSwift

final class PerfectSquaresTest: XCTestCase {
  
  func testDPBottomUp() throws {
    PerfectSquares.testCases.forEach { input, expected in
      XCTAssertEqual(PerfectSquares.DPBottomUp.solve(input), expected)
    }
  }
}
