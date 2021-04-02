//
//  binaryNOR.swift
//  Calculator
//
//  Created by 강경 on 2021/04/02.
//

import Foundation

extension CalculateBinaryNumber {
  func binaryNOR(_ firstOperands: Stack<Int>, _ secondOperands: Stack<Int>) -> Int {
    let firstOperandAfterNotOperator = binaryNOT(firstOperands)
    let firstOperandsAfterNotOperator = Stack<Int>()
    let firstOperandAfterNotOperatorArray = "\(firstOperandAfterNotOperator)".digits
    for firstOperandNumber in firstOperandAfterNotOperatorArray {
      firstOperandsAfterNotOperator.push(firstOperandNumber)
    }
    
    let secondOperandAfterNotOperator = binaryNOT(secondOperands)
    let secondOperandsAfterNotOperator = Stack<Int>()
    let secondOperandAfterNotOperatorArray = "\(secondOperandAfterNotOperator)".digits
    for secondOperandNumber in secondOperandAfterNotOperatorArray {
      secondOperandsAfterNotOperator.push(secondOperandNumber)
    }
    
    result = binaryOR(firstOperandsAfterNotOperator, secondOperandsAfterNotOperator)
    return result
  }
}
