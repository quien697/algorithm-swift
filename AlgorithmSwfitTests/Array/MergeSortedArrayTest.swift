//
//  MergeSortedArrayTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-26.
//

import XCTest
@testable import AlgorithmSwift

final class MergeSortedArrayTest: XCTestCase {
  
  func testTwoPointers() throws {
    MergeSortedArray.testCases.forEach { input, expected in
      var nums1 = input.0
      let m = input.1
      let nums2 = input.2
      let n = input.3
      XCTAssertEqual(MergeSortedArray.TwoPointers.solve(&nums1, m, nums2, n), expected)
      
    }
  }
}
