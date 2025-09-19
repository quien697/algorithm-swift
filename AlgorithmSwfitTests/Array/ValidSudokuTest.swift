//
//  ValidSudokuTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-19.
//

import XCTest
@testable import AlgorithmSwift

final class ValidSudokuTest: XCTestCase {
  
  func testHashTable() throws {
    ValidSudoku.testCases.forEach { input, expected in
      XCTAssertEqual(ValidSudoku.HashTable.solve(input), expected)
    }
  }
}
