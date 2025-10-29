//
//  LongestCommonSubsequenceTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-29.
//

//
//  HouseRobberTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-02.
//

import XCTest
@testable import AlgorithmSwift

final class LongestCommonSubsequenceTest: XCTestCase {
  
  func testDPBottomUp() throws {
    LongestCommonSubsequence.testCases.forEach { input, expected in
      let text1 = input.0
      let text2 = input.1
      XCTAssertEqual(LongestCommonSubsequence.DPBottomUp.solve(text1, text2), expected)
    }
  }
}
