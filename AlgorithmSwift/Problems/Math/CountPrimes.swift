//
//  CountPrimes.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-29.
//

import Foundation

/**
 *
 * LeetCode
 *
 * 204. Count Primes
 * https://leetcode.com/problems/count-primes
 *
 **/
enum CountPrimes: ProblemProtocol {
  static let name: String = "Count Primes"
  static let domain: Domain = .Math
  static let testCases: [(Int, Int)] = [
    (10, 4),
    (0, 0),
    (1, 0),
  ]
  
  /**
   *
   * Approach: Math (Sieve of Eratosthenes)
   * Time: O(N Log (Log N))
   * Space: O(N)
   *
   */
  enum Math: ApproachProtocol {
    static let approaches: [Approach] = [
      .Math,
      .SieveOfEratosthenes
    ]
    
    static func solve(_ n: Int) -> Int {
      guard n > 1 else { return 0 }
      
      var primes  = Array(repeating: true, count: n)
      primes[0] = false
      primes[1] = false
      var count = 0
      
      for i in 2..<n {
        if primes[i] {
          count += 1
          var num = i * 2
          
          while num < n {
            primes[num] = false
            num += i
          }
        }
      }
      
      return count
    }
    
    static func run() {
      printTestsResult(
        testCases,
        problem: name,
        approaches: approaches,
        run: solve,
        inputDescription: { input in
          "n = \(input)"
        }
      )
    }
  }
}
