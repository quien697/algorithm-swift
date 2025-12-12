//
//  InsertionSort.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-12-10.
//

/// Insertion Sort
///
/// - Time Complexity: O(N²)
/// - Space Complexity: O(1)
///
/// - Parameters:
///   - array: The array of elements to sort
///   - comparator: A closure that returns `true` if the first value
///                 should be ordered before the second
///
/// - Returns: A new array containing the sorted elements
func insertionSort<T: Comparable>(
  _ array: [T],
  _ comparator: (T, T) -> Bool
) -> [T] {
  let count = array.count
  guard count > 1 else { return array }
  
  var sorted = array
  
  for i in 1..<count {
    let current = sorted[i]
    var j = i - 1
    
    while j >= 0 && comparator(current, sorted[j]) {
      sorted[j + 1] = sorted[j]
      j -= 1
    }
    
    sorted[j + 1] = current
  }
  
  return sorted
}
