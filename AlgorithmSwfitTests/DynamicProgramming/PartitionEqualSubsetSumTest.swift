//
//  PartitionEqualSubsetSumTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-11-04.
//

import XCTest
@testable import AlgorithmSwift

final class PartitionEqualSubsetSumTest: XCTestCase {
  
  func testDPBottomUp() throws {
    PartitionEqualSubsetSum.testCases.forEach { input, expected in
      XCTAssertEqual(PartitionEqualSubsetSum.DPBottomUp.solve(input), expected)
    }
  }
  
  func testDPBottomUpSet() throws {
    PartitionEqualSubsetSum.testCases.forEach { input, expected in
      XCTAssertEqual(PartitionEqualSubsetSum.DPBottomUpSet.solve(input), expected)
    }
  }
}
