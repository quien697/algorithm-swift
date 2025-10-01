//
//  ClimbingStairsTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-01.
//

import XCTest
@testable import AlgorithmSwift

final class ClimbingStairsTest: XCTestCase {
  
  func testDPBottomUp() throws {
    ClimbingStairs.testCases.forEach { input, expected in
      XCTAssertEqual(ClimbingStairs.DPBottomUp.solve(input), expected)
    }
  }
  
  func testDPBottomUpNoSpace() throws {
    ClimbingStairs.testCases.forEach { input, expected in
      XCTAssertEqual(ClimbingStairs.DPBottomUpNoSpace.solve(input), expected)
    }
  }
  
  func testDPTopDown() throws {
    ClimbingStairs.testCases.forEach { input, expected in
      XCTAssertEqual(ClimbingStairs.DPTopDown.solve(input), expected)
    }
  }
}
