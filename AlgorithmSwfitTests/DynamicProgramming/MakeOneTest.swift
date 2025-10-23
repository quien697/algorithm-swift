//
//  MakeOneTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-23.
//

import XCTest
@testable import AlgorithmSwift

final class MakeOneTest: XCTestCase {
  
  func testDPBottomUp() throws {
    MakeOne.testCases.forEach { input, expected in
      XCTAssertEqual(MakeOne.DPBottomUp.solve(input), expected)
    }
  }
  
  func testDPTopDown() throws {
    MakeOne.testCases.forEach { input, expected in
      XCTAssertEqual(MakeOne.DPTopDown.solve(input), expected)
    }
  }
}
