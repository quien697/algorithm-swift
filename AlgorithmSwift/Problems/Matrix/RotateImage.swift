//
//  RotateImage.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-19.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 48. Rotate Image
 * https://leetcode.com/problems/rotate-image
 *
 **/
enum RotateImage: ProblemProtocol {
  static let name: String = "Rotate Image"
  static let domain: Domain = .Matrix
  static let testCases: [([[Int]], [[Int]])] = [
    (
      [[1,2,3],[4,5,6],[7,8,9]],
      [[7,4,1],[8,5,2],[9,6,3]]
    ),
    (
      [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]],
      [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
    ),
  ]
  
  /**
   *
   * Approach: Matrix (Reverse + Transpose)
   * Time: O(N ^ 2)
   * Space: O(1)
   *
   */
  enum Matrix: ApproachProtocol {
    static let approaches: [Approach] = [
      .Matrix,
      .Reverse,
      .Transpose,
    ]
    
    static func solve(_ matrix: inout [[Int]]) -> [[Int]] {
      matrix.reverse()
      
      for row in 0..<matrix.count {
        for col in 0...row {
          let temp = matrix[row][col]
          matrix[row][col] = matrix[col][row]
          matrix[col][row] = temp
        }
      }
      
      return matrix
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: { (input: [[Int]]) -> [[Int]] in
          var matrix = input
          return solve(&matrix)
        },
        inputDescription: { input in
          "matrix = \(input)"
        }
      )
    }
  }
}
