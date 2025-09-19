//
//  RemoveDuplicatesFromSortedArrayTest.swift
//  AlgorithmSwfitTests
//
//  Created by Quien on 2025-09-14.
//

import XCTest
@testable import AlgorithmSwift

final class RemoveDuplicatesFromSortedArrayTest: XCTestCase {
  
  func testTwoPointers() throws {
    RemoveDuplicatesFromSortedArray.testCases.forEach { input, expected in
      var nums = input
      XCTAssertEqual(RemoveDuplicatesFromSortedArray.TwoPointers.solve(&nums), expected)
    }
  }
}
