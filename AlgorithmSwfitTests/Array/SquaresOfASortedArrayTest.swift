//
//  SquaresOfASortedArrayTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-28.
//

import XCTest
@testable import AlgorithmSwift

final class SquaresOfASortedArrayTest: XCTestCase {
  
  func testTwoPointers() throws {
    SquaresOfASortedArray.testCases.forEach { input, expected in
      XCTAssertEqual(SquaresOfASortedArray.TwoPointers.solve(input), expected)
    }
  }
}
