//
//  BinaryOperators.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

enum BinaryOperators: String, Comparable {
  static func < (operator1: BinaryOperators, operator2: BinaryOperators) -> Bool {
    if (operator1 == .Plus || operator1 == .Minus || operator1 == .AND || operator1 == .NAND
          || operator1 == .OR || operator1 == .NOR || operator1 == .XOR)
    && (operator2 == .NOT || operator2 == .LeftShift || operator2 == .RightShift) {
      return true
    } else {
      return false
    }
  }
  
  case Plus = "+"
  case Minus = "-"
  case AND = "&"
  case NAND = "~&"
  case OR = "|"
  case NOR = "~|"
  case XOR = "^"
  case NOT = "~"
  case LeftShift = "<<"
  case RightShift = ">>"
}
