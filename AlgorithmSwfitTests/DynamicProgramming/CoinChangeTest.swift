//
//  CoinChangeTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-17.
//

import XCTest
@testable import AlgorithmSwift

final class CoinChangeTest: XCTestCase {
  
  func testDPBottomUp() throws {
    CoinChange.testCases.forEach { input, expected in
      let coins = input.0
      let amount = input.1
      XCTAssertEqual(CoinChange.DPBottomUp.solve(coins, amount), expected)
    }
  }
}
