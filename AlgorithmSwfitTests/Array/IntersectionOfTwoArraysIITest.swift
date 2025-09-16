//
//  IntersectionOfTwoArraysIITest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-16.
//

import XCTest
@testable import AlgorithmSwift

final class IntersectionOfTwoArraysIITest: XCTestCase {
  
  func textSortingTwoPointer() throws {
    IntersectionOfTwoArraysII.testCases.forEach { input, expected in
      let nums1 = input.0, nums2 = input.1
      XCTAssertEqual(IntersectionOfTwoArraysII.SortingTwoPointer.solve(nums1, nums2).sorted(), expected)
    }
  }
  
  func testHashTable() throws {
    IntersectionOfTwoArraysII.testCases.forEach { input, expected in
      let nums1 = input.0, nums2 = input.1
      XCTAssertEqual(IntersectionOfTwoArraysII.HashTable.solve(nums1, nums2).sorted(), expected)
    }
  }
}
