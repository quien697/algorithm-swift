//
//  RollDice.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-18.
//

/**
 * Roll Dice (Backtracking / Exhaustive Search)
 *
 * Generates all possible sequences of rolling a 6-sided die `n` times.
 * Each outcome is an array of length `n` where each value is in 1...6.
 *
 * Approach: Backtracking (Exhaustive Search)
 * Time Complexity: O(6 ^ N)
 * Space Complexity:
 * - Auxiliary: O(N) (recursion depth + current path)
 * - Output: O(6 ^ N x N) (storing all results)
 */
func rollDice(_ n: Int) -> [[Int]] {
  guard n >= 0 else { return [] }
  
  var result: [[Int]] = []
  var path: [Int] = []
  
  func dfs(_ rolls: Int) {
    // Base case
    if rolls == 0 {
      result.append(path)
      return
    }
    
    // Recursive case
    for face in 1...6 {
      path.append(face) // choose
      dfs(rolls - 1)
      path.removeLast() // un-choose (backtrack)
    }
  }
  
  dfs(n)
  return result
}

//private func rollDiceHelper(_ n: Int, path: inout [Int], result: inout [[Int]]) {
//  // Base case
//  if n == 0 {
//    result.append(path)
//    return
//  }
//  
//  // Recursive case
//  for face in 1...6 {
//    path.append(face) // choose
//    rollDiceHelper(n - 1, path: &path, result: &result)
//    path.removeLast() // un-choose (backtrack)
//  }
//}

/**
 * Roll Dice with Target Sum
 *
 * Generates all sequences of rolling a 6-sided die `n` times
 * such that the total sum equals `target`.
 *
 * Approach: Backtracking with Pruning
 * Time Complexity: O(6 ^ N)
 * Space Complexity:
 * - Auxiliary: O(n)
 * - Output: O(K x N), where k is number of valid sequences
 *
 * Pruning Rules:
 * - If target < 0 → impossible
 * - If target > 6 * n → impossible
 *
 */
func rollDiceSum(_ n: Int, target: Int) -> [[Int]] {
  var result: [[Int]] = []
  var path: [Int] = []
  
  func dfs(_ rolls: Int, _ target: Int) {
    // Pruning
    if target < 0 || target > 6 * n {
      return
    }
    
    // Base case
    if rolls == 0 {
      if target == 0 {
        result.append(path)
      }
      
      return
    }
    
    // Recursive case
    for face in 1...6 {
      path.append(face) // choose
      dfs(rolls - 1, target - face)
      path.removeLast() // un-choose
    }
  }
  
  dfs(n, target)
  return result
}

/**
 * Roll Dice with Target Sum (with Tight Pruning)
 *
 * Generates all sequences of rolling a 6-sided die `n` times
 * such that the total sum equals `target`.
 *
 * Approach: Backtracking with Pruning
 * Time Complexity: O(6 ^ N)
 * Space Complexity:
 * - Auxiliary: O(n)
 * - Output: O(K x N), where K is number of valid sequences
 *
 * Pruning:
 * After choosing a face, check whether the remaining rolls can still reach `target`:
 *   newSoFar + 1*(remaining) <= target <= newSoFar + 6*(remaining)
 *
 */
func rollDiceSumOptimized(_ n: Int, target: Int) -> [[Int]] {
  guard n >= 0 else { return [] }
  guard target >= n && target <= 6 * n else { return [] }
  
  var result: [[Int]] = []
  var path: [Int] = []
  
  func dfs(_ remainingRolls: Int, _ soFar: Int) {
    if remainingRolls == 0 {
      if soFar == target {
        result.append(path)
      }
      
      return
    }
    
    for face in 1...6 {
      let newSoFar = soFar + face
      let left = remainingRolls - 1
      
      let minPossible = newSoFar + 1 * left
      let maxPossible = newSoFar + 6 * left
      guard minPossible <= target && target <= maxPossible else { continue }
      
      path.append(face)
      dfs(left, newSoFar)
      path.removeLast()
    }
  }
  
  dfs(n, 0)
  return result
}
