//
//  TwoSumTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-18.
//

import XCTest
@testable import AlgorithmSwift

final class TwoSumTest: XCTestCase {
  
  func testBruteForce() throws {
    TwoSum.testCases.forEach { input, expected in
      let nums = input.0
      let target = input.1
      XCTAssertEqual(TwoSum.BruteForce.solve(nums, target), expected)
    }
  }
  
  func testHashTable() throws {
    TwoSum.testCases.forEach { input, expected in
      let nums = input.0
      let target = input.1
      XCTAssertEqual(TwoSum.HashTable.solve(nums, target), expected)
    }
  }
}
