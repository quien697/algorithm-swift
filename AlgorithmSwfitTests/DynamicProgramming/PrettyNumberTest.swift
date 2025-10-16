//
//  PrettyNumberTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-16.
//

import XCTest
@testable import AlgorithmSwift

final class PrettyNumberTest: XCTestCase {
  
  func testDPBottomUp() throws {
    PrettyNumber.testCases.forEach { input, expected in
      XCTAssertEqual(PrettyNumber.DPBottomUp.solve(input), expected)
    }
  }
  
  func testDPSpaceOptimized() throws {
    PrettyNumber.testCases.forEach { input, expected in
      XCTAssertEqual(PrettyNumber.DPSpaceOptimized.solve(input), expected)
    }
  }
}
