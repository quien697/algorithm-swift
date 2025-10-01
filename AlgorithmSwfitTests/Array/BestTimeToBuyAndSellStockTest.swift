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
  
  func testDynamicProgramming() throws {
    BestTimeToBuyAndSellStock.testCases.forEach { input, expected in
      XCTAssertEqual(BestTimeToBuyAndSellStock.DynamicProgramming.solve(input), expected)
    }
  }
}
