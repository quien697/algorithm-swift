//
//  BestTimeToBuyAndSellStockIITest.swift
//  AlgorithmSwfitTests
//
//  Created by Quien on 2025-09-14.
//

import XCTest
@testable import AlgorithmSwift

final class BestTimeToBuyAndSellStockIITest: XCTestCase {
  
  func testGreedy() throws {
    BestTimeToBuyAndSellStockII.testCases.forEach { input, expected in
      XCTAssertEqual(BestTimeToBuyAndSellStockII.GreedyOnePass.solve(input), expected)
    }
  }
}
