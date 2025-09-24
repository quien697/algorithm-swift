//
//  StringToIntegerATOITest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-24.
//

import XCTest
@testable import AlgorithmSwift

final class StringToIntegerATOITest: XCTestCase {
  
  func testStringTraversal() throws {
    StringToIntegerATOI.testCases.forEach { input, expected in
      XCTAssertEqual(StringToIntegerATOI.StringTraversal.solve(input), expected)
    }
  }
}
