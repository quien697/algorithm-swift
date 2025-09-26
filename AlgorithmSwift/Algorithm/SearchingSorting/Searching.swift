//
//  Searching.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-26.
//

/// Linear Search
///
/// - Time Complexity: O(N)
/// - Space complexity: O(1)
/// - Parameters:
///   - collection: An array of `Equatable` elements
///   - target: The element to find
/// - Returns: The index of `target`,  otherwise `nil`
func linearSearch<T: Equatable>(in collection: [T], for target: T) -> Int? {
  for (index, element) in collection.enumerated() where element == target {
    return index
  }
  return nil
}
