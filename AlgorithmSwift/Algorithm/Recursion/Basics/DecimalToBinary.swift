//
//  DecimalToBinary.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-18.
//

/**
 * Decimal to Binary Conversion
 *
 * Converts a decimal integer into its binary string representation.
 *
 * Approach: Recursion
 * Time Complexity: O(log N)
 * Space Complexity: O(log N)
 *
 */
func decimalToBinary(_ n: Int) -> String {
  if n < 0 {
    return "-" + decimalToBinaryHelper(-n)
  }
  
  return decimalToBinaryHelper(n)
}

private func decimalToBinaryHelper(_ n: Int) -> String {
  guard n > 1 else { return String(n) }
  
  return decimalToBinaryHelper(n / 2) + String(n % 2)
}
