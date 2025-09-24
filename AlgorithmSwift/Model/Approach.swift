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
  case Dictionary = "Dictionary"
  case Greedy = "Greedy"
  case HashTable = "Hash Table"
  case Matrix = "Matrix"
  case Math = "Math"
  case OnePass = "One-Pass"
  case Reverse = "Reverse"
  case Set = "Set"
  case Sorting = "Sorting"
  case SlowFast = "Slow-Fast"
  case Simulation = "Simulation"
  case Swap = "Swap"
  case TwoPointers = "Two Pointers"
  case Transpose = "Transpose"
  case XOR = "XOR"
  case LeftRight = "Left-Right"
  case StringTraversal = "String Traversal"
}
