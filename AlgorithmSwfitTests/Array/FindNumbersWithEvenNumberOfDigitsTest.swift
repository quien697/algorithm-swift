//
//  FindNumbersWithEvenNumberOfDigitsTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-27.
//

import XCTest
@testable import AlgorithmSwift

final class FindNumbersWithEvenNumberOfDigitsTest: XCTestCase {
  
  func testLinearScan() throws {
    FindNumbersWithEvenNumberOfDigits.testCases.forEach { input, expected in
      XCTAssertEqual(FindNumbersWithEvenNumberOfDigits.LinearScan.solve(input), expected)
    }
  }
}
