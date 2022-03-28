//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Lingo on 2022/03/23.
//

import UIKit

final class CalculatorViewModel {
  
  private(set) var operatorType = Observable<String?>(nil)
  private(set) var operandValue = Observable<String>("0")
  private var formulas = [String]()
  private var isDotted: Bool {
    self.operandValue.value.contains(".")
  }
  
  func clearAll() {
    self.formulas.removeAll()
    self.operatorType.next(nil)
    self.operandValue.next("0")
  }
  
  func clearEntry() {
    self.operandValue.next("0")
  }
  
  func convertSign() {
    var value = self.operandValue.value
    if value.hasPrefix("-") {
      value.removeFirst()
    } else if let number = Double(value), number > 0 {
      value = "-\(value)"
    }
    self.operandValue.next(value)
  }
  
  func addOperand(of numberString: String) {
    guard self.operandValue.value.count <= 19 else {
      return
    }
    var value = self.operandValue.value
    if value == "0" && numberString == "00" {
      value = "0"
    } else if value == "0" && numberString != "00" {
      value = numberString
    } else {
      value += numberString
    }
    self.operandValue.next(value)
  }
  
  func addDot() {
    guard self.isDotted == false else {
      return
    }
    let value = self.operandValue.value + "."
    self.operandValue.next(value)
  }
  
  func addOperator(of operatorString: String) -> Bool {
    if self.operandValue.value == "0" && self.operatorType.value == nil {
      return false
    }
    if self.operandValue.value == "0" && self.operatorType.value != nil {
      self.operatorType.next(operatorString)
      return false
    }
    if let operatorType = self.operatorType.value {
      self.formulas.append(operatorType)
    }
    self.formulas.append(self.operandValue.value)
    self.operatorType.next(operatorString)
    self.operandValue.next("0")
    return true
  }
  
  func calculate() -> Bool {
    if self.operandValue.value == "0" && self.operatorType.value == nil {
      return false
    }
    
    if self.formulas.isEmpty {
      return false
    }
    
    if let operatorType = self.operatorType.value {
      self.formulas.append(operatorType)
    }
    self.formulas.append(self.operandValue.value)
    let inputString = self.formulas.joined(separator: " ")
    var formula = ExpressionParser.parse(from: inputString)
    guard let result = try? formula.result() else {
      return false
    }
    self.operatorType.next(nil)
    self.operandValue.next("\(result)")
    self.formulas.removeAll()
    return true
  }
}
