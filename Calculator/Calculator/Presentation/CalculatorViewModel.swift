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
  var isResult: Bool = false
  
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
    if value.contains("-") {
      value.removeFirst()
    } else if let number = Double(value), number > 0 {
      value = "-\(number)"
    }
    self.operandValue.next(value)
  }
  
  func didTapNumberButton(of numberString: String) {
    guard self.operandValue.value.count <= 19 else {
      return
    }
    var newValue: String
    let oldValue = self.operandValue.value
    if oldValue == "0" {
      newValue = numberString
    } else {
      newValue = oldValue + numberString
    }
    self.operandValue.next(newValue)
  }
  
  func didTapDotButton() {
    guard self.isDotted == false else {
      return
    }
    let newValue = self.operandValue.value + "."
    self.operandValue.next(newValue)
  }
  
  func didTapOperatorButton(of operatorString: String) -> Bool {
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
  
  func didTapCalculateButton() -> Bool {
    if self.operandValue.value == "0" && self.operatorType.value == nil {
      return false
    }
    
    if self.formulas.count == Int.zero {
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
    self.isResult = true
    self.operatorType.next(nil)
    self.operandValue.next("\(result)")
    self.formulas.removeAll()
    return true
  }
  
  func makeSubResultStackView() -> UIStackView {
    let operand = self.operandValue.value
    let operatorType = self.operatorType.value
    let stackView = UIStackView.create(type: operatorType, operand: operand)
    return stackView
  }
}
