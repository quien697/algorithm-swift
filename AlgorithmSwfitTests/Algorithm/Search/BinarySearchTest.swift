//
//  BinarySearchTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-27.
//

import XCTest

@testable import AlgorithmSwift

final class BinarySearchTest: XCTestCase {
  let intCases: [([Int], Int, Int?)] = [
    ([1, 3, 5, 7, 9], 7, 3),
    ([1, 3, 5, 7, 9], 1, 0),
    ([1, 3, 5, 7, 9], 9, 4),
    ([1, 3, 5, 7, 9], 6, nil),
    ([], 42, nil),
    ([2, 2, 2], 2, 1),
  ]
  let stringCases: [([String], String, Int?)] = [
    (["Alex", "Bob", "Nico", "Tom"], "Nico", 2),
    (["Alex", "Bob", "Nico", "Tom"], "Dan", nil),
  ]
    
  func testIntArray() throws {
   intCases.forEach { input, target, expected in
     XCTAssertEqual(binarySearch(in: input, for: target), expected)
    }
  }
  
  func testStringArray() throws {
   stringCases.forEach { input, target, expected in
     XCTAssertEqual(binarySearch(in: input, for: target), expected)
    }
  }
}
