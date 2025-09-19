//
//  RotateImageTest.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-19.
//

import XCTest
@testable import AlgorithmSwift

final class RotateImageTest: XCTestCase {
  
  func testMatrix() throws {
    RotateImage.testCases.forEach { input, expected in
      var matrix = input
      XCTAssertEqual(RotateImage.Matrix.solve(&matrix), expected)
    }
  }
}
