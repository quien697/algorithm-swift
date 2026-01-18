//
//  GeneratePermutations.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-18.
//

/**
 * Generate All Permutations
 *
 * Generates all permutations of the given string.
 * If the input contains duplicate characters, duplicates will appear in output.
 *
 * Approach: Recursion + Exhaustive Search (Backtracking)
 * Time Complexity: O(N! x N)  (n! permutations, each string build costs O(n))
 * Space Complexity:
 * - Auxiliary: O(N)  (recursion depth)
 * - Output: O(N! x N)
 */
func generatePermutations(_ word: String) -> [String] {
  var chars = Array(word)
  var result: [String] = []
  generatePermutationsHelper(&chars, start: 0, result: &result)
  
  return result
}

private func generatePermutationsHelper(
  _ chars: inout [Character],
  start: Int,
  result: inout [String]) {
    // Base case
    if start == chars.count {
      result.append(String(chars))
      return
    }
    
    // Recursive case
    for i in start..<chars.count {
      chars.swapAt(start, i)
      generatePermutationsHelper(&chars, start: start + 1, result: &result)
      // backtrack
      chars.swapAt(start, i)
    }
  }

/**
 * Generate Unique Permutations
 *
 * Generates all unique permutations of the given string (handles duplicates).
 *
 * Approach: Backtracking with Set
 * Time Complexity: O(K x N)
 *  where k is number of unique permutations (≤ n!)
 * Space Complexity:
 * - Auxiliary: O(n) recursion depth + O(n) used-per-level
 * - Output: O(K x N)
 */
func generateUniquePermutations(_ word: String) -> [String] {
  var chars = Array(word)
  var result: [String] = []
  generateUniquePermutationsHelper(&chars, start: 0, result: &result)
  
  return result
}

private func generateUniquePermutationsHelper(
  _ chars: inout [Character],
  start: Int,
  result: inout [String]) {
    // Base case
    if start == chars.count {
      result.append(String(chars))
      return
    }
    
    var used = Set<Character>()
    
    // Recursive case
    for i in start..<chars.count {
      if used.contains(chars[i]) { continue }
      used.insert(chars[i])
      
      chars.swapAt(start, i)
      generateUniquePermutationsHelper(&chars, start: start + 1, result: &result)
      // backtrack
      chars.swapAt(start, i)
    }
  }
