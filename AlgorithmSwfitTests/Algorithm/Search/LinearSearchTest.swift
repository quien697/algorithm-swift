//
//  LinearSearchTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-26.
//

import XCTest

@testable import AlgorithmSwift

final class LinearSearchTest: XCTestCase {
  let intCases: [([Int], Int, Int?)] = [
    ([3, 7, 1, 9], 7, 1),
    ([1, 2, 3], 99, nil),
    ([], 1, nil),
    ([5, 5, 5], 5, 0),
  ]
  let stringCases: [([String], String, Int?)] = [
    (["Apple", "banana", "melon", "berry"], "melon", 2),
    (["Apple", "banana"], "Amy", nil),
  ]
    
  func testIntArray() throws {
   intCases.forEach { input, target, expected in
     XCTAssertEqual(linearSearch(in: input, for: target), expected)
    }
  }
  
  func testStringArray() throws {
   stringCases.forEach { input, target, expected in
     XCTAssertEqual(linearSearch(in: input, for: target), expected)
    }
  }
}
