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
    
    repeat {
      let inputString = readLine()!
      
      if inputString.count > 9 {
        print("9자리 까지만 입력이 가능합니다. 다시 입력해주세요.")
        continue
      }
      
      if inputString == "=" {
        result = CalculateDecimalNumber().calculate(operands, operators)
        isRepeat = false
        break
      }
      
      if numeralSystem == .Decimal {
        stackDecimalNumber(inputString)
      } else {
        // 이진수 연산 미구현
//        stackBinaryNumber(inputString)
      }
      
    } while isRepeat
    
    print(result)
  }
  
  private func stackDecimalNumber(_ inputString: String) {
    let operateDecimalNumber = CalculateDecimalNumber()
    
    switch DecimalOperators(rawValue: inputString) {
    case .Plus, .Minus, .Multiplication, .Divide:
      if operators.isEmpty() {
        operators.push(inputString)
        return
      }
      
      guard let preOperator = DecimalOperators(rawValue: operators.peek()!) else {
        operators.push(inputString)
        return
      }
      if preOperator > .Plus {
        let intermediateCalculationNumber = operateDecimalNumber.calculate(operands, operators)
        operands.push(intermediateCalculationNumber)
      }

      operators.push(inputString)
    default:
      let inputInteger = Int(inputString)!
      operands.push(inputInteger)
    }
  }
}
