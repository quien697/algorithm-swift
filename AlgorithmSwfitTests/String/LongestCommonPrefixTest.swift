//
//  LongestCommonPrefixTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-25.
//

import XCTest
@testable import AlgorithmSwift

final class LongestCommonPrefixTest: XCTestCase {
  
  func testStringTraversal() throws {
    LongestCommonPrefix.testCases.forEach { input, expected in
      XCTAssertEqual(LongestCommonPrefix.StringTraversal.solve(input), expected)
    }
  }
}
