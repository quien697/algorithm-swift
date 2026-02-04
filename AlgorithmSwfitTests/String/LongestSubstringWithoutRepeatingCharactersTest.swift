//
//  LongestSubstringWithoutRepeatingCharactersTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-04.
//

import XCTest
@testable import AlgorithmSwift

final class LongestSubstringWithoutRepeatingCharactersTest: XCTestCase {
  
  func testStringTraversal() throws {
    LongestSubstringWithoutRepeatingCharacters.testCases.forEach { input, expected in
      XCTAssertEqual(LongestSubstringWithoutRepeatingCharacters.SlidingWindow.solve(input), expected)
    }
  }
}
