//
//  Power.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-18.
//

/**
 * Power
 *
 * Approach: Recursion
 * Time Complexity: O(N)
 * Space Complexity: O(N)
 *
 */
func power(base: Int, exponent: Int) -> Int {
  assert(exponent >= 0, "Exponent must be non-negative")
  
  // base case
  if exponent == 0 { return 1 }
  // recursive case
  return base * power(base: base, exponent: exponent - 1)
}
