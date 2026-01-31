//
//  FindTheIndexOfTheFirstOccurrenceInAStringTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-24.
//

import XCTest
@testable import AlgorithmSwift

final class FindTheIndexOfTheFirstOccurrenceInAStringTest: XCTestCase {
  
  func testBruteForceSubstringSearchStringIndex() throws {
    FindTheIndexOfTheFirstOccurrenceInAString.testCases.forEach { input, expected in
      let haystack = input.0
      let needle = input.1
      XCTAssertEqual(FindTheIndexOfTheFirstOccurrenceInAString.BruteForceSubstringSearchStringIndex.solve(haystack, needle), expected)
    }
  }
  
  func testBruteForceSubstringSearchArrayIndex() throws {
    FindTheIndexOfTheFirstOccurrenceInAString.testCases.forEach { input, expected in
      let haystack = input.0
      let needle = input.1
      XCTAssertEqual(FindTheIndexOfTheFirstOccurrenceInAString.BruteForceSubstringSearchArrayIndex.solve(haystack, needle), expected)
    }
  }
}
