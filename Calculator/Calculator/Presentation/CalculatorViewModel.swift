//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Lingo, mmim on 2022/03/28.
//

import UIKit

final class CalculatorViewModel {
  
  private(set) var operatorType = Observable<String?>(nil)
  private(set) var operandValue = Observable<String>(Constants.zero)
  private(set) var isResult: Bool = false
  private var formulas = [String]()
  var isDotted: Bool {
    self.operandValue.value.contains(Constants.dot)
  }
  
  func clearAll() {
    self.formulas.removeAll()
    self.operatorType.next(nil)
    self.operandValue.next(Constants.zero)
    self.isResult = false
  }
  
  func clearEntry() {
    self.operandValue.next(Constants.zero)
  }
  
  func convertSign() {
    var value = self.operandValue.value
    if value.hasPrefix(Constants.minusSign) {
      value.removeFirst()
    } else if let number = Double(value), number > .zero {
      value = "\(Constants.minusSign)\(value)"
    }
    self.operandValue.next(value)
  }
  
  func addOperand(of numberString: String) {
    guard self.isResult || self.operandValue.value.count <= Constants.maximumNumberCount else {
      return
    }
    var value = self.operandValue.value
    if value == Constants.zero && numberString == Constants.doubleZero {
      value = Constants.zero
      self.operandValue.next(value)
      return
    } else if value == Constants.zero && numberString != Constants.doubleZero {
      value = numberString
      self.operandValue.next(value)
      return
    }
    if self.isResult {
      value = numberString
      self.isResult = false
    } else {
      value += numberString
    }
    self.operandValue.next(value)
  }
  
  func addDot() {
    guard self.isDotted == false else {
      return
    }
    let value = self.operandValue.value + Constants.dot
    self.operandValue.next(value)
  }
  
  func addOperator(of operatorString: String) -> Bool {
    guard self.operandValue.value != Constants.nan,
          self.operandValue.value != Constants.zero || self.operatorType.value != nil
    else {
      return false
    }
    self.isResult = false
    if self.operandValue.value == Constants.zero && self.operatorType.value != nil {
      self.operatorType.next(operatorString)
      return false
    }
    if let operatorType = self.operatorType.value {
      self.formulas.append(operatorType)
    }
    self.formulas.append(self.operandValue.value)
    self.operatorType.next(operatorString)
    self.operandValue.next(Constants.zero)
    return true
  }
  
  func calculate() -> Bool {
    guard self.operandValue.value != Constants.zero || self.operatorType.value != nil,
          !self.formulas.isEmpty
    else {
      return false
    }
    if let operatorType = self.operatorType.value {
      self.formulas.append(operatorType)
    }
    self.formulas.append(self.operandValue.value)
    let inputString = self.formulas.joined(separator: Constants.whiteSpace)
    var formula = ExpressionParser.parse(from: inputString)
    guard let result = try? formula.result() else {
      return false
    }
    self.isResult = true
    if result == .zero {
      self.operandValue.next(Constants.zero)
    } else {
      self.operandValue.next("\(result)")
    }
    self.operatorType.next(nil)
    self.formulas.removeAll()
    return true
  }
}
