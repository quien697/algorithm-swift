//
//  BinarySearch.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-27.
//

/// Binary Search
///
/// - Time Complexity: O(Log N)
/// - Space complexity: O(1)
///
/// - Parameters:
///   - collection: A sorted array of element that conform to `Comparable`
///   - target: The value to search for
///
/// - Returns: The index of `target` if found,  otherwise `nil`
func binarySearch<T: Comparable>(
  in collection: [T],
  for target: T
) -> Int? {
  var lower = 0
  var upper = collection.count - 1
  
  while lower <= upper {
    let mid = lower + (upper - lower) / 2
    let value = collection[mid]
    
    if value == target {
      return mid
    } else if value < target {
      lower = mid + 1
    } else {
      upper = mid - 1
    }
  }
  
  return nil
}
