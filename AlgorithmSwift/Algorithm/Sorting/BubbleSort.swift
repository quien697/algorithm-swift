//
//  BubbleSort.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-12-10.
//

/// Bubble Sort
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
func bubbleSort<T: Comparable>(
  _ array: [T],
  _ comparator: (T, T) -> Bool
) -> [T] {
  let count = array.count
  guard count > 1 else { return array }
  
  var sorted = array
  
  for i in 0..<count - 1 {
    var isSwapped = false
    
    for j in 1..<count - i {
      if comparator(sorted[j], sorted[j-1]) {
        sorted.swapAt(j, j-1)
        isSwapped = true
      }
    }
    
    // if no swaps in this pass which means the array is already sorted
    if !isSwapped { break }
  }
  
  return sorted
}
