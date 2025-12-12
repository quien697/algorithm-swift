//
//  SelectionSort.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-12-10.
//

/// Selection Sort
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
func selectionSort<T: Comparable>(
  _ array: [T],
  _ comparator: (T, T) -> Bool
) -> [T] {
  let count = array.count
  guard count > 1 else { return array }
  
  var sorted = array
  
  for i in 0..<count - 1 {
    var minIndax = i
    
    for j in i+1..<count {
      if comparator(sorted[j], sorted[minIndax]) {
        minIndax = j
      }
    }
    
    // Swap only if a new min was found
    if i != minIndax {
      sorted.swapAt(minIndax, i)
    }
  }
  
  return sorted
}
