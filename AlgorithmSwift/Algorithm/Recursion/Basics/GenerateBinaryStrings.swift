//
//  GenerateBinaryStrings.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-18.
//

/**
 * Generate All Binary Strings
 *
 * Generates all possible binary strings of length `n`.
 *
 * Approach: Recursion + Exhaustive Search (Backtracking)
 * Time Complexity: O(2 ^ N)
 * Space Complexity:
 * - Auxiliary: O(n)  (recursion depth)
 * - Output: O(2 ^ N x N) (storing all results)
 */
func generateBinaryStrings(_ n: Int) -> [String] {
  var result: [String] = []
  generateBinaryStringsHelper(n, "", &result)
  
  return result
}

private func generateBinaryStringsHelper(
  _ n: Int,
  _ soFar: String,
  _ result: inout [String]
) {
  // Base case: length reached
  if n == 0 {
    result.append(soFar)
    return
  }

  // Recursive case: choose 0 or 1
  generateBinaryStringsHelper(n - 1, soFar + "0", &result)
  generateBinaryStringsHelper(n - 1, soFar + "1", &result)
}
