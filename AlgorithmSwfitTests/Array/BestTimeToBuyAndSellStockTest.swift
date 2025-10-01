//
//  BestTimeToBuyAndSellStockTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-10-01.
//

import XCTest
@testable import AlgorithmSwift

final class BestTimeToBuyAndSellStockTest: XCTestCase {
  
  func testGreedy() throws {
    BestTimeToBuyAndSellStock.testCases.forEach { input, expected in
      XCTAssertEqual(BestTimeToBuyAndSellStock.Greedy.solve(input), expected)
    }
  }
  
  func testDynamicProblemming() throws {
    BestTimeToBuyAndSellStock.testCases.forEach { input, expected in
      XCTAssertEqual(BestTimeToBuyAndSellStock.DynamicProblemming.solve(input), expected)
    }
  }
}
