//
//  GenerateDecimalStrings.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-18.
//

/**
 * Generate All Decimal Strings
 *
 * Generates all possible decimal strings of length `n`
 * using digits from 0 to 9.
 *
 * Approach: Recursion + Exhaustive Search
 * Time Complexity: O(10 ^ N)
 * Space Complexity:
 * - Auxiliary: O(n) (recursion depth)
 * - Output: O(10 ^ N x N) (storing all results)
 */
func generateDecimalStrings(_ n: Int) -> [String] {
  var result: [String] = []
  generateDecimalStringsHelper(n, "", &result)
  
  return result
}

private func generateDecimalStringsHelper(
  _ n: Int,
  _ soFar: String,
  _ result: inout [String]
) {
  // Base case: length reached
  if n == 0 {
    result.append(soFar)
    return
  }
  
  // Recursive case: try all digits 0–9
  for digit in 0...9 {
    generateDecimalStringsHelper(n - 1, soFar + "\(digit)", &result)
  }
}
