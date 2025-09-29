//
//  Domain.swift
//  AlgorithmSwift
//
//  Created by Quien on 2025-09-19.
//

enum Domain: String {
  case Array = "Array"
  case Matrix = "Matrix"
  case Search = "Search"
  case String = "String"
}

protocol ProblemProtocol {
  static var name: String { get }
  static var domain: Domain { get }
}
