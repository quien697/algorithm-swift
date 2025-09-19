//
//  MoveZeroesTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-17.
//

import XCTest
@testable import AlgorithmSwift

final class MoveZeroesTest: XCTestCase {
  
  func testTwoPointers() throws {
    MoveZeroes.testCases.forEach { input, expected in
      var nums = input
      XCTAssertEqual(MoveZeroes.TwoPointers.solve(&nums), expected)
    }
  }
}
