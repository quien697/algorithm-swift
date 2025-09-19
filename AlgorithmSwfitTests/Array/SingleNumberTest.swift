//
//  SingleNumberTest.swift
//  AlgorithmSwfitTests
//
//  Created by Quien on 2025-09-14.
//

import XCTest
@testable import AlgorithmSwift

final class SingleNumberTest: XCTestCase {
  
  func testBitwise() throws {
    SingleNumber.testCases.forEach { input, expected in
      XCTAssertEqual(SingleNumber.Bitwise.solve(input), expected)
    }
  }
}
