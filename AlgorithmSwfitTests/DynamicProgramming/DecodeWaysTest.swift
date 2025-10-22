//
//  DecodeWaysTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-22.
//

import XCTest
@testable import AlgorithmSwift

final class DecodeWaysTest: XCTestCase {
  
  func testDPBottomUp() throws {
    DecodeWays.testCases.forEach { input, expected in
      XCTAssertEqual(DecodeWays.DPBottomUp.solve(input), expected)
    }
  }
  
  func testDPBottomUpOptimized() throws {
    DecodeWays.testCases.forEach { input, expected in
      XCTAssertEqual(DecodeWays.DPBottomUpOptimized.solve(input), expected)
    }
  }
}
