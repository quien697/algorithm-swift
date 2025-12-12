//
//  MergeSort.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-12-10.
//

/// Merge Sort
///
/// A stable, divide-and-conquer sorting algorithm
///   1. Recursively splits the array into halves,
///   2. Sorts each half,
///   3. Merges the two sorted halves into a single sorted array.
///
/// - Time Complexity: O(N log N)
/// - Space Complexity: O(N)
///
/// - Parameters:
///   - array: The array of elements to sort.
///   - comparator: A closure that returns `true` if the first value
///                 should be ordered before the second
///
/// - Returns: A new array containing the sorted elements
func mergeSort<T: Comparable>(
  _ array: [T],
  _ comparator: (T, T) -> Bool
) -> [T] {
  let count = array.count
  guard count > 1 else { return array }
  
  // divide
  let mid = count / 2
  let leftSorted = mergeSort(Array(array[0..<mid]), comparator)
  let rightSorted = mergeSort(Array(array[mid...]), comparator)
  
  // conquer (merge)
  return merge(leftSorted, rightSorted, comparator)
}

func merge<T: Comparable>(
  _ left: [T],
  _ right: [T],
  _ comparator: (T, T) -> Bool
) -> [T] {
  var i = 0
  var j = 0
  var merged: [T] = []
  merged.reserveCapacity(left.count + right.count)
  
  // Merge while both sides have elements
  while i < left.count && j < right.count {
    if comparator(left[i], right[j]) {
      merged.append(left[i])
      i += 1
    } else {
      merged.append(right[j])
      j += 1
    }
  }
  
  // Append any remaining elements
  if i < left.count {
    merged.append(contentsOf: left[i...])
  }
  if j < right.count {
    merged.append(contentsOf: right[j...])
  }
  
  return merged
}
