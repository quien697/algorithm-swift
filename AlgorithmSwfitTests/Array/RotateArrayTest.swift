//
//  RotateArrayTest.swift
//  AlgorithmSwfitTests
//
//  Created by Quien on 2025-09-14.
//

import XCTest
@testable import AlgorithmSwift

final class RotateArrayTest: XCTestCase {
  
  func testBruteForce() throws {
    RotateArray.testCases.forEach { input, expected in
      var nums = input.0
      let k = input.1
      XCTAssertEqual(RotateArray.BruteForce.solve(&nums, k), expected)
    }
  }
  
  func testReverse() throws {
    RotateArray.testCases.forEach { input, expected in
      var nums = input.0
      let k = input.1
      XCTAssertEqual(RotateArray.Reverse.solve(&nums, k), expected)
    }
  }
}
