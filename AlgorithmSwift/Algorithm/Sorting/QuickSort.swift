//
//  QuickSort.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-12-11.
//

/// Quick Sort
///
/// A divide-and-conquer, in-place sorting algorithm
///   1. Selects a pivot
///   2. Partitions elements into "less than pivot" and "greater than pivot"
///   3. Recursively sorts the partitions
///
/// - Time Complexity: O(N log N)
///   - Worst:   O(N²) when the pivot is consistently poor
///
/// - Space Complexity: O(log N)
///   - Worst:   O(N)
///
/// - Parameters:
///   - array: The array to sort (modified in-place)
///   - start: The starting index of the range to sort
///   - end:   The ending index of the range to sort
///   - comparator: A closure that returns `true` if the first
///                 value should be ordered before the second.
func quickSort<T: Comparable>(
  _ array: inout [T],
  _ start: Int,
  _ end: Int,
  _ comparator: (T, T) -> Bool
) {
  guard start < end else { return }
  
  // divide
  let pivot = partition(&array, start, end, comparator)
  // conquer (merge)
  quickSort(&array, start, pivot - 1, comparator)
  quickSort(&array, pivot + 1, end, comparator)
}



func partition<T: Comparable>(
  _ array: inout [T],
  _ start: Int,
  _ end: Int,
  _ comparator: (T, T) -> Bool
) -> Int {
  let pivot = array[end]
  var i = start
  
  for j in start..<end {
    if comparator(array[j], pivot) {
      array.swapAt(i, j)
      i += 1
    }
  }
  
  array.swapAt(i, end)
  return i
}
