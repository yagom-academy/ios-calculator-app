//
//  Calculator.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

class Calculator {
  private let firstOperands = Stack<Int>()
  private let secondOperands = Stack<Int>()

  func run(_ numeralSystem: NumeralSystem) {
    var result: [Int] = []
    var isRepeat = true
    var operands = firstOperands
    var opertor: Operators = .Plus
    
    print()
    print("숫자와 연산자를 입력해 주세요...")
    
    repeat {
      let inputString = readLine()!
      
      switch(inputString) {
      case "=":
        result = calculate(operator: opertor)
        isRepeat = false
      case "+":
        opertor = .Plus
        operands = secondOperands
      case "-":
        opertor = .Minus
        operands = secondOperands
      case "*":
        opertor = .Multiplication
        operands = secondOperands
      case "/":
        opertor = .Divide
        operands = secondOperands
      case "&":
        opertor = .AND
        operands = secondOperands
      case "~&":
        opertor = .NAND
        operands = secondOperands
      case "|":
        opertor = .OR
        operands = secondOperands
      case "~|":
        opertor = .NOR
        operands = secondOperands
      case "^":
        opertor = .XOR
        operands = secondOperands
      case "~":
        opertor = .NOT
        operands = secondOperands
      case "<<":
        opertor = .LeftShift
        operands = secondOperands
      case ">>":
        opertor = .RightShift
        operands = secondOperands
      default:
        let inputInteger = Int(inputString)!
        
        do {
          try operands.push(number: inputInteger)
        } catch {
          print(error)
        }
      }
    } while isRepeat
    
    print(result)
  }
  
  private func calculate(operator: Operators) -> [Int] {
    let proceedOperation = Operator()
    
    switch `operator` {
    case .Plus:
      return proceedOperation.plus(firstOperands, secondOperands)
    case .Minus:
      return proceedOperation.Minus(firstOperands, secondOperands)
    case .Multiplication:
      return proceedOperation.Multiplication(firstOperands, secondOperands)
    case .Divide:
      return proceedOperation.Divide(firstOperands, secondOperands)
    case .AND:
      return proceedOperation.AND(firstOperands, secondOperands)
    case .NAND:
      return proceedOperation.NAND(firstOperands, secondOperands)
    case .OR:
      return proceedOperation.OR(firstOperands, secondOperands)
    case .NOR:
      return proceedOperation.NOR(firstOperands, secondOperands)
    case .XOR:
      return proceedOperation.XOR(firstOperands, secondOperands)
    case .NOT:
      return proceedOperation.NOT(firstOperands, secondOperands)
    case .LeftShift:
      return proceedOperation.LeftShift(firstOperands, secondOperands)
    case .RightShift:
      return proceedOperation.RightShift(firstOperands, secondOperands)
    default:
      return [0]
    }
  }
}
