//
//  ContainsDuplicateTest.swift
//  AlgorithmSwfitTests
//
//  Created by Quien on 2025-09-14.
//

import XCTest
@testable import AlgorithmSwift

final class ContainsDuplicateTest: XCTestCase {
  
  func testBruteForce() throws {
    ContainsDuplicate.testCases.forEach { input, expected in
      XCTAssertEqual(ContainsDuplicate.BruteForce.solve(input), expected)
    }
  }
  
  func testHashTable() throws {
    ContainsDuplicate.testCases.forEach { input, expected in
      XCTAssertEqual(ContainsDuplicate.HashTable.solve(input), expected)
    }
  }
}
