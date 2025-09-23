//
//  ReverseStringTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-20.
//

import XCTest
@testable import AlgorithmSwift

final class ReverseStringTest: XCTestCase {
  
  func testTwoPointers() throws {
    ReverseString.testCases.forEach { input, expected in
      var s = input
      XCTAssertEqual(ReverseString.TwoPointers.solve(&s), expected)
    }
  }
}
