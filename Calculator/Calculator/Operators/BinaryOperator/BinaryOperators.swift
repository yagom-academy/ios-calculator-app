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

extension CalculateBinaryNumber {
  func plus(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    var results:[String] = []
    var carry = 0
    
    for _ in 1...9 {
      var isCarryOccur = false
      
      var firstOperand = 0
      if !firstOperands.isEmpty() {
        firstOperand = firstOperands.peek()!
        firstOperands.pop()
      }
      
      var secondOperand = 0
      if !secondOperands.isEmpty() {
        secondOperand = secondOperands.peek()!
        secondOperands.pop()
      }
      
      var sum = firstOperand ^ secondOperand
      if (firstOperand == 1 && secondOperand == 1)
      || (sum == 1 && carry == 1){
        isCarryOccur = true
      }
      sum ^= carry
      
      if isCarryOccur {
        carry = 1
      } else {
        carry = 0
      }
      results.insert("\(sum)", at: 0)
    }
    
    let resultString = results.joined()
    result = Int(resultString)!

    return result
  }
  
  func minus(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    // secondOperands의 보수 구하기: 1. "~"연산을 진행한다
    let secondOperandAfterNotOperator = NOT(secondOperands)
    let secondOperandsAfterNotOperator = Stack<Int>()
    let secondOperandAfterNotOperatorArray = "\(secondOperandAfterNotOperator)".digits
    for secondOperandNumber in secondOperandAfterNotOperatorArray {
      secondOperandsAfterNotOperator.push(secondOperandNumber)
    }
        
    // secondOperands의 보수 구하기: 2. "+1"연산을 진행한다
    let stackForPlusOne = Stack<Int>()
    stackForPlusOne.push(1)
    
    let secondOperandAfterPlusOne = plus(secondOperandsAfterNotOperator, stackForPlusOne)
    
    // firstOperands와 secondOperands의 보수를 더한다
    let secondOperandsComplements = Stack<Int>()
    let secondOperandAfterNOTOperatorArray = "\(secondOperandAfterPlusOne)".digits
    for secondOperandNumber in secondOperandAfterNOTOperatorArray {
      secondOperandsComplements.push(secondOperandNumber)
    }
    
    return plus(firstOperands, secondOperandsComplements)
  }
  
  func AND(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    
    // result = 여기에 결과 값을 넣어주세요
    return result
  }
  
  func NAND(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    let firstOperandAfterNotOperator = NOT(firstOperands)
    let firstOperandsAfterNotOperator = Stack<Int>()
    let firstOperandAfterNotOperatorArray = "\(firstOperandAfterNotOperator)".digits
    for firstOperandNumber in firstOperandAfterNotOperatorArray {
      firstOperandsAfterNotOperator.push(firstOperandNumber)
    }
    
    let secondOperandAfterNotOperator = NOT(secondOperands)
    let secondOperandsAfterNotOperator = Stack<Int>()
    let secondOperandAfterNotOperatorArray = "\(secondOperandAfterNotOperator)".digits
    for secondOperandNumber in secondOperandAfterNotOperatorArray {
      secondOperandsAfterNotOperator.push(secondOperandNumber)
    }
    
    result = AND(firstOperandsAfterNotOperator, secondOperandsAfterNotOperator)
    return result
  }
  
  func OR(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    var arr: Array<String> = []
    var stringResult = String()
    
    while !firstOperands.isEmpty() || !secondOperands.isEmpty() {
      if !firstOperands.isEmpty() && !secondOperands.isEmpty() {
        if firstOperands.peek()! == 1 || secondOperands.peek()! == 1 {
          arr.insert("1", at: 0)
          firstOperands.pop()
          secondOperands.pop()
        } else {
          arr.insert("0", at: 0)
          firstOperands.pop()
          secondOperands.pop()
        }
      } else if !firstOperands.isEmpty() {
        if firstOperands.peek() == 1 {
          arr.insert("1", at: 0)
          firstOperands.pop()
        } else if firstOperands.peek() == 0 {
          arr.insert("0", at: 0)
          firstOperands.pop()
        }
      } else if !secondOperands.isEmpty() {
        if secondOperands.peek() == 1 {
          arr.insert("1", at: 0)
          secondOperands.pop()
        } else if secondOperands.peek() == 0 {
          arr.insert("0", at: 0)
          secondOperands.pop()
        }
      }
    }
    for element in arr {
      stringResult += element
    }
    result = Int(stringResult)!
    return result
  }
  
  func NOR(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    let firstOperandAfterNotOperator = NOT(firstOperands)
    let firstOperandsAfterNotOperator = Stack<Int>()
    let firstOperandAfterNotOperatorArray = "\(firstOperandAfterNotOperator)".digits
    for firstOperandNumber in firstOperandAfterNotOperatorArray {
      firstOperandsAfterNotOperator.push(firstOperandNumber)
    }
    
    let secondOperandAfterNotOperator = NOT(secondOperands)
    let secondOperandsAfterNotOperator = Stack<Int>()
    let secondOperandAfterNotOperatorArray = "\(secondOperandAfterNotOperator)".digits
    for secondOperandNumber in secondOperandAfterNotOperatorArray {
      secondOperandsAfterNotOperator.push(secondOperandNumber)
    }
    
    result = OR(firstOperandsAfterNotOperator, secondOperandsAfterNotOperator)
    return result
  }
  
  func XOR(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    var results:[String] = []
    
    for _ in 1...9 {
      var firstOperand = 0
      if !firstOperands.isEmpty() {
        firstOperand = firstOperands.peek()!
        firstOperands.pop()
      }
      
      var secondOperand = 0
      if !secondOperands.isEmpty() {
        secondOperand = secondOperands.peek()!
        secondOperands.pop()
      }
      
      results.insert("\(firstOperand ^ secondOperand)", at: 0)
    }
    
    let resultString = results.joined()
    result = Int(resultString)!

    return result
  }
  
  func NOT(_ operands: Stack<Int>) -> Int {
    var results:[String] = []
        
    for _ in 1...9 {
      var operand = 0
      if !operands.isEmpty() {
        operand = operands.peek()!
        operands.pop()
      }
            
      if operand == 0 {
        operand = 1
      } else {
        operand = 0
      }

      results.insert("\(operand)", at: 0)
    }
    
    let resultString = results.joined()
    result = Int(resultString)!

    return result
  }
  
  func leftShift(_ operands: Stack<Int>) -> Int {
    var results:[String] = []
    
    results.insert("0", at: 0)
    for _ in 1...8 {
      var operand = 0
      if !operands.isEmpty() {
        operand = operands.peek()!
        operands.pop()
      }
      
      results.insert("\(operand)", at: 0)
    }
    
    let resultString = results.joined()
    result = Int(resultString)!

    return result
  }
  
  func rightShift(_ operands: Stack<Int>) -> Int {
    var results:[String] = []
    
    for _ in 1...9 {
      var operand = 0
      if !operands.isEmpty() {
        operand = operands.peek()!
        operands.pop()
      }
      
      results.insert("\(operand)", at: 0)
    }
    results.removeLast()
    results.insert("0", at: 0)
    
    let resultString = results.joined()
    result = Int(resultString)!

    return result
  }
}
