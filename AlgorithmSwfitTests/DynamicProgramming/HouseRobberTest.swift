//
//  HouseRobberTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-02.
//

import XCTest
@testable import AlgorithmSwift

final class HouseRobberTest: XCTestCase {
  
  func testDPBottomUp() throws {
    HouseRobber.testCases.forEach { input, expected in
      XCTAssertEqual(HouseRobber.DPBottomUp.solve(input), expected)
    }
  }
  
  func testDPBottomUpOptimized() throws {
    HouseRobber.testCases.forEach { input, expected in
      XCTAssertEqual(HouseRobber.DPBottomUpOptimized.solve(input), expected)
    }
  }
}
