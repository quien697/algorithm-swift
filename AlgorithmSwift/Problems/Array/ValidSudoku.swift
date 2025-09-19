//
//  ValidSudoku.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-18.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 36. Valid Sudoku
 * https://leetcode.com/problems/valid-sudoku
 *
 **/
enum ValidSudoku: ProblemProtocol {
  static let name: String = "Valid Sudoku"
  static let domain: Domain = .Array
  static let testCases: [([[Character]], Bool)] = [
    (
      [["5","3",".",".","7",".",".",".","."],
       ["6",".",".","1","9","5",".",".","."],
       [".","9","8",".",".",".",".","6","."],
       ["8",".",".",".","6",".",".",".","3"],
       ["4",".",".","8",".","3",".",".","1"],
       ["7",".",".",".","2",".",".",".","6"],
       [".","6",".",".",".",".","2","8","."],
       [".",".",".","4","1","9",".",".","5"],
       [".",".",".",".","8",".",".","7","9"]], true
    ),
    (
      [["8","3",".",".","7",".",".",".","."],
       ["6",".",".","1","9","5",".",".","."],
       [".","9","8",".",".",".",".","6","."],
       ["8",".",".",".","6",".",".",".","3"],
       ["4",".",".","8",".","3",".",".","1"],
       ["7",".",".",".","2",".",".",".","6"],
       [".","6",".",".",".",".","2","8","."],
       [".",".",".","4","1","9",".",".","5"],
       [".",".",".",".","8",".",".","7","9"]], false
    ),
    (
      [["5","3",".",".","7",".",".",".","."],
       ["6","8",".","1","9","5",".",".","."],
       [".","9","8",".",".",".",".","6","."],
       ["8",".",".",".","6",".",".",".","3"],
       ["4",".",".","8",".","3",".",".","1"],
       ["7",".",".",".","2",".",".",".","6"],
       [".","6",".",".",".",".","2","8","."],
       [".",".",".","4","1","9",".",".","5"],
       [".",".",".",".","8",".",".","7","9"]], false)
  ]
  
  /**
   *
   * Approach: Hash Table (Dictionary + Set)
   * Time: O(N ^ 2)
   * Space: O(N ^ 2)
   *
   */
  enum HashTable: ApproachProtocol {
    static let approaches: [Approach] = [
      .HashTable,
      .Dictionary,
      .Set,
    ]
    
    struct Box: Hashable {
      let row: Int
      let col: Int
    }
    
    static func solve(_ board: [[Character]]) -> Bool {
      let num = 9
      var rows = [Int: Set<Character>]()
      var cols = [Int: Set<Character>]()
      var boxes = [Box: Set<Character>]()
      
      for row in 0..<num {
        for col in 0..<num {
          let cell = board[row][col]
          guard cell != "." else { continue }
          
          let boxKey = Box(row: row/3, col: col/3)
          
          if (
            rows[row, default: []].contains(cell) ||
            cols[col, default: []].contains(cell) ||
            boxes[boxKey, default: []].contains(cell)
          ) {
            return false
          }
          
          rows[row, default: []].insert(cell)
          cols[col, default: []].insert(cell)
          boxes[boxKey, default: []].insert(cell)
        }
      }
      
      return true
    }
    
    static func run() {
      printProblemTitle(problem: name, approaches: approaches)
      
      for (index, testCase) in testCases.enumerated() {
        let board = testCase.0
        let expected = testCase.1
        print("\nCase \(index + 1):")
        print("Board = \(board)")
        print("Result = ", solve(board))
        print("Expected = ", expected)
      }
    }
  }
}
