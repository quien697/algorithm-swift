//
//  MaximumSubarrayTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-02.
//

import XCTest

@testable import AlgorithmSwift

final class MaximumSubarrayTest: XCTestCase {
  
  func testDynamicProgramming() throws {
    MaximumSubarray.testCases.forEach() { input, expected in
      XCTAssertEqual(MaximumSubarray.DPBottomUp.solve(input), expected)
    }
  }
  
  func testKadanes() throws {
    MaximumSubarray.testCases.forEach() { input, expected in
      XCTAssertEqual(MaximumSubarray.Kadanes.solve(input), expected)
    }
  }
}
