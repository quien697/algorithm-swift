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
  case BinarySearch = "Binary Search"
  case Bitwise = "Bitwise"
  case BottomUp = "Bottom Up (Tabulation)"
  case BruteForce = "Brute Force"
  case BruteForceSubstringSearch = "Brute Force Substring Search"
  case DynamicProgramming = "Dynamic Programming"
  case Dictionary = "Dictionary"
  case ExpandAroundCenter = "Expand Around Center"
  case Greedy = "Greedy"
  case HashTable = "Hash Table"
  case LeftRight = "Left-Right"
  case LinearScan = "Linear Scan"
  case LinearSearch = "Linear Search"
  case Matrix = "Matrix"
  case Math = "Math"
  case OnePass = "One-Pass"
  case Prefix = "Prefix"
  case Recursion = "Recursion"
  case Reverse = "Reverse"
  case SpaceOptimized = "Space Optimized"
  case Set = "Set"
  case SlowFast = "Slow-Fast"
  case Simulation = "Simulation"
  case SlidingWindow = "Sliding Window"
  case Sorting = "Sorting"
  case Stack = "stack"
  case StringTraversal = "String Traversal"
  case Swap = "Swap"
  case TopDown = "Top Down (Memorization)"
  case Transpose = "Transpose"
  case TwoPointers = "Two Pointers"
  case XOR = "XOR"
  case SieveOfEratosthenes = "Sieve of Eratosthenes"
  case Kadanes = "Kadane’s Algorithm"
}
