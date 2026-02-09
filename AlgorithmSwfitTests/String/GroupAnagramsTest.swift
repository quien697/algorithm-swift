//
//  GroupAnagramsTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-09.
//

import XCTest
@testable import AlgorithmSwift

final class GroupAnagramsTest: XCTestCase {
  
  func testHashTable() throws {
    GroupAnagrams.testCases.forEach { input, expected in
      let result = GroupAnagrams.HashTable.solve(input)
      XCTAssertEqual(sorting(result), sorting(expected))
    }
  }
  
  func sorting(_ array: [[String]]) -> [[String]] {
    array
      .map { $0.sorted() } // sort words only
      .sorted {$0.lexicographicallyPrecedes($1) } // sort group
  }
}
