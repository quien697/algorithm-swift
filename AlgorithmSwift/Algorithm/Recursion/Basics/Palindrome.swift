//
//  Palindrome.swift
//  AlgorithmSwift
//
//  Created by Quien on 2026-01-18.
//

/**
 * Recursive Palindrome Check
 *
 * Given a string, determine whether it is a palindrome using recursion.
 *
 * Approach: Recursion
 * Time: O(N ^ 2)
 * Space: O(N)
 *
 */
func isPalindrome(word: String) -> Bool {
  // Base case
  if word.count <= 1 { return true }
  
  // Recursive case
  if let first = word.first,
     let last = word.last,
     first == last {
    let start = word.index(after: word.startIndex)
    let end = word.index(before: word.endIndex)
    return isPalindrome(word: String(word[start..<end]))
  }
  
  return false
}
