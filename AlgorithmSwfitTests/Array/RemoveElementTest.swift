//
//  RemoveElementTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-03-01.
//

import XCTest
@testable import AlgorithmSwift

final class RemoveElementTest: XCTestCase {
  
  func testTwoPointers() throws {
    RemoveElement.testCases.forEach { input, expected in
      var nums = input.0
      let val = input.1
      XCTAssertEqual(RemoveElement.TwoPointers.solve(&nums, val), expected)
    }
  }
}
