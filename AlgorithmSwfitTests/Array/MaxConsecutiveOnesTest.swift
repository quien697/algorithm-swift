//
//  MaxConsecutiveOnesTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-26.
//

import XCTest
@testable import AlgorithmSwift

final class MaxConsecutiveOnesTest: XCTestCase {
  
  func testLinearScan() throws {
    MaxConsecutiveOnes.testCases.forEach { input, expected in
      XCTAssertEqual(MaxConsecutiveOnes.LinearScan.solve(input), expected)
    }
  }
}
