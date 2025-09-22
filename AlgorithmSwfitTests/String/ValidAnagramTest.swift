//
//  ValidAnagramTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-22.
//

import XCTest
@testable import AlgorithmSwift

final class ValidAnagramTest: XCTestCase {
  
  func testMatrix() throws {
    ValidAnagram.testCases.forEach { input, expected in
      let s = input.0
      let t = input.1
      XCTAssertEqual(ValidAnagram.HashTable.solve(s, t), expected)
    }
  }
}
