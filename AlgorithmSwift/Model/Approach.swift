//
//  Approach.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-14.
//

protocol ApproachProtocol {
  static var approaches: [Approach] { get }
}

/// Represents the main algorithmic approach used to solve a problem.
/// And highlights specific techniques or tricks when needed.
enum Approach: String {
  case Bitwise = "Bitwise"
  case BruteForce = "Brute Force"
  case BruteForceSubstringSearch = "Brute Force Substring Search"
  case Dictionary = "Dictionary"
  case Greedy = "Greedy"
  case HashTable = "Hash Table"
  case LeftRight = "Left-Right"
  case Matrix = "Matrix"
  case Math = "Math"
  case OnePass = "One-Pass"
  case Prefix = "Prefix"
  case Reverse = "Reverse"
  case Set = "Set"
  case SlowFast = "Slow-Fast"
  case Simulation = "Simulation"
  case SlidingWindow = "Sliding Window"
  case Sorting = "Sorting"
  case StringTraversal = "String Traversal"
  case Swap = "Swap"
  case Transpose = "Transpose"
  case TwoPointers = "Two Pointers"
  case XOR = "XOR"
}
