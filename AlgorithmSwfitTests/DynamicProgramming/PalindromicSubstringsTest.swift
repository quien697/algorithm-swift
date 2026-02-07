//
//  PalindromicSubstringsTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-02-07.
//

import XCTest
@testable import AlgorithmSwift

final class PalindromicSubstringsTest: XCTestCase {
  
  func testDPBottomUp() throws {
    PalindromicSubstrings.testCases.forEach { input, expected in
      XCTAssertEqual(PalindromicSubstrings.DPBottomUp.solve(input), expected)
    }
  }
  
  func testExpandAroundCenter() throws {
    PalindromicSubstrings.testCases.forEach { input, expected in
      XCTAssertEqual(PalindromicSubstrings.ExpandAroundCenter.solve(input), expected)
    }
  }
}
