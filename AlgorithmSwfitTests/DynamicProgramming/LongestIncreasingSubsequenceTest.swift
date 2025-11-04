//
//  LongestIncreasingSubsequenceTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-29.
//

import XCTest
@testable import AlgorithmSwift

final class LongestIncreasingSubsequenceTest: XCTestCase {
  
  func testDPBottomUp() throws {
    LongestIncreasingSubsequence.testCases.forEach { input, expected in
      XCTAssertEqual(LongestIncreasingSubsequence.DPBottomUp.solve(input), expected)
    }
  }
  
  func testDPLinearSearch() throws {
    LongestIncreasingSubsequence.testCases.forEach { input, expected in
      XCTAssertEqual(LongestIncreasingSubsequence.DPLinearSearch.solve(input), expected)
    }
  }
  
  func testDPBinarySearch() throws {
    LongestIncreasingSubsequence.testCases.forEach { input, expected in
      XCTAssertEqual(LongestIncreasingSubsequence.DPBinarySearch.solve(input), expected)
    }
  }
}
