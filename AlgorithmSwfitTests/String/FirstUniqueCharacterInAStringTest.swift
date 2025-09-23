//
//  FirstUniqueCharacterInAStringTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-22.
//

import XCTest
@testable import AlgorithmSwift

final class FirstUniqueCharacterInAStringTest: XCTestCase {
  
  func testHashTable() throws {
    FirstUniqueCharacterInAString.testCases.forEach { input, expected in
      XCTAssertEqual(FirstUniqueCharacterInAString.HashTable.solve(input), expected)
    }
  }
}
