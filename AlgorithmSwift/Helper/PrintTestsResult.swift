//
//  PrintTestsResult.swift
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

func printTestsResult<Input, Output>(
  _ testCases: [(Input, Output)],
  problem: String,
  approaches: [Approach] = [],
  run: (Input) -> Output,
  inputDescription: (Input) -> String
) where Output: Equatable {
  // Print Title
  if approaches.isEmpty {
    print("=== \(problem) ===")
  } else {
    let approachesString = approaches.map { $0.rawValue }.joined(separator: " + ")
    print("=== \(problem) (\(approachesString)) ===")
  }
  
  // Print Result
  for (index, testCase) in testCases.enumerated() {
    let input = testCase.0
    let expected = testCase.1
    let result = run(input)

    print("\nCase \(index + 1):")
    print(inputDescription(input))
    print("Result   = \(result)")
    print("Expected = \(expected)")
  }
  
  print("\n")
}
