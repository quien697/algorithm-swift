//
//  FindTheIndexOfTheFirstOccurrenceInAStringTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-24.
//

import XCTest
@testable import AlgorithmSwift

final class FindTheIndexOfTheFirstOccurrenceInAStringTest: XCTestCase {
  
  func testSlidingWindow() throws {
    FindTheIndexOfTheFirstOccurrenceInAString.testCases.forEach { input, expected in
      let haystack = input.0
      let needle = input.1
      XCTAssertEqual(FindTheIndexOfTheFirstOccurrenceInAString.BruteForceSubstringSearch.solve(haystack, needle), expected)
    }
  }
}
