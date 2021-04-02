//
//  Calculator.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

class Calculator {
  private let operands = Stack<Int>()
  private let operators = Stack<String>()
  
  func run(_ numeralSystem: NumeralSystem) {
    var result: Int = 0
    var isRepeat = true
    
    print()
    print("You chose the \(numeralSystem)")
    print("숫자와 연산자를 입력해 주세요...")
    
    while isRepeat {
      let inputString = readLine()!
      
      if inputString.count > 9 {
        print("9자리 까지만 입력이 가능합니다. 다시 입력해주세요.")
        continue
      }
      
      if numeralSystem == .Decimal {
        if inputString == "=" {
          result = CalculateDecimalNumber().calculate(operands, operators)
          isRepeat = false
          break
        }
        
        stackDecimalNumber(inputString)
      } else {
        if inputString == "=" {
          result = CalculateBinaryNumber().calculate(operands, operators)
          isRepeat = false
          break
        }
        
        stackBinaryNumber(inputString)
      }
    }
    
    print(result % 1000000000)
  }
  
  private func stackDecimalNumber(_ inputString: String) {
    let operateDecimalNumber = CalculateDecimalNumber()
    
    switch DecimalOperators(rawValue: inputString) {
    case .Plus, .Minus, .Multiplication, .Divide:
      if operators.isEmpty() {
        operators.push(inputString)
      } else {
        guard let preOperator = DecimalOperators(rawValue: operators.peek()!) else {
          operators.push(inputString)
          return
        }
        if preOperator > DecimalOperators(rawValue: inputString)! {
          let intermediateCalculationNumber = operateDecimalNumber.calculate(operands, operators)
          operands.push(intermediateCalculationNumber)
        }

        operators.push(inputString)
      }
    default:
      let inputInteger = Int(inputString)!
      operands.push(inputInteger)
    }
  }
  
  private func stackBinaryNumber(_ inputString: String) {
    let operateBinaryNumber = CalculateBinaryNumber()
    
    switch BinaryOperators(rawValue: inputString) {
    case .Plus, .Minus, .AND, .NAND, .OR, .NOR, .XOR, .NOT, .LeftShift, .RightShift:
      if operators.isEmpty() {
        operators.push(inputString)
      } else {
        guard let preOperator = BinaryOperators(rawValue: operators.peek()!) else {
          operators.push(inputString)
          return
        }
        if preOperator > BinaryOperators(rawValue: inputString)! {
          let intermediateCalculationNumber = operateBinaryNumber.calculate(operands, operators)
          operands.push(intermediateCalculationNumber)
        }

        operators.push(inputString)
      }
    default:
      let inputInteger = Int(inputString)!
      operands.push(inputInteger)
    }
  }
}
