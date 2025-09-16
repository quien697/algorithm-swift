//
//  Approach.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-14.
//

protocol ApproachProtocol {
  static var techniques: [String] { get }
}

enum Technique: String {
  case Bitwise = "Bitwise Operation"
  case BruteForce = "Brute Force"
  case Greedy = "Greedy"
  case HashTable = "Hash Table"
  case OnePass = "One-Pass"
  case Reverse = "Reverse"
  case Sorting = "Sorting"
  case TwoPointer = "Two Pointer"
}
