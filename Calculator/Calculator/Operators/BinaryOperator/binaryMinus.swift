//
//  binaryMinus.swift
//  Calculator
//
//  Created by 강경 on 2021/04/02.
//

import Foundation

extension CalculateBinaryNumber {
  func binaryMinus(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    // secondOperands의 보수 구하기: 1. "~"연산을 진행한다
    let secondOperandAfterNotOperator = binaryNOT(secondOperands)
    let secondOperandsAfterNotOperator = Stack<Int>()
    let secondOperandAfterNotOperatorArray = "\(secondOperandAfterNotOperator)".digits
    for secondOperandNumber in secondOperandAfterNotOperatorArray {
      secondOperandsAfterNotOperator.push(secondOperandNumber)
    }
        
    // secondOperands의 보수 구하기: 2. "+1"연산을 진행한다
    let stackForPlusOne = Stack<Int>()
    stackForPlusOne.push(1)
    
    let secondOperandAfterPlusOne = binaryPlus(secondOperandsAfterNotOperator, stackForPlusOne)
    
    // firstOperands와 secondOperands의 보수를 더한다
    let secondOperandsComplements = Stack<Int>()
    let secondOperandAfterNOTOperatorArray = "\(secondOperandAfterPlusOne)".digits
    for secondOperandNumber in secondOperandAfterNOTOperatorArray {
      secondOperandsComplements.push(secondOperandNumber)
    }
    
    return binaryPlus(firstOperands, secondOperandsComplements)
  }
}
