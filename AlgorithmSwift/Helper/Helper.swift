//
//  PrintHelper.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-19.
//

func printProblemTitle(problem: String, approaches: [Approach]) {
  if approaches.isEmpty {
    print("=== \(problem) ===")
  } else {
    let approachesString = approaches.map { $0.rawValue }.joined(separator: " + ")
    print("=== \(problem) (\(approachesString)) ===")
  }
}
