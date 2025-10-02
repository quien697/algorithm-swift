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
  
  func testDPSpaceOptimized() throws {
    HouseRobber.testCases.forEach { input, expected in
      XCTAssertEqual(HouseRobber.DPSpaceOptimized.solve(input), expected)
    }
  }
}
