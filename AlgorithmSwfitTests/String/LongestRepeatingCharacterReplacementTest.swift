//
//  LongestRepeatingCharacterReplacementTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-10.
//

import XCTest
@testable import AlgorithmSwift

final class LongestRepeatingCharacterReplacementTest: XCTestCase {
  
  func testSlidingWindow() throws {
    LongestRepeatingCharacterReplacement.testCases.forEach { input, expected in
      let s = input.0
      let k = input.1
      XCTAssertEqual(LongestRepeatingCharacterReplacement.SlidingWindow.solve(s, k), expected)
    }
  }
}
