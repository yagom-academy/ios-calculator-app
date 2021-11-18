//
//  Formula.swift
//  Calculator
//
//  Created by LIMGAUI on 2021/11/17.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators =  CalculatorItemQueue<Operator>()
        
    mutating func result() -> Double {
        var resultNumber = 0.0
        
        for _ in 1..<operands.arraySize {
            guard let firstNumber = operands.deleteFront(),
                  let secondNumber = operands.deleteFront(),
                  let firstOperator = operators.deleteFront() else {
                      return resultNumber
                  }
            let leftoverNumbers = operands.bringArray
            let calculatedNumber = firstOperator.calculate(lhs: firstNumber, rhs: secondNumber)
            operands.deleteAll()
            operands.push(calculatedNumber)
            operands.pushArray(leftoverNumbers)
            
            if operands.arraySize == 1 {
                resultNumber = calculatedNumber
            }
        }
        return resultNumber
    }
}

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operandsAndOperators = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
        let separatedOperandsArray = makeOperators(from: input)
        let separatedOperatorsArray = makeOperators(from: input)
        
        separatedOperandsArray.forEach({ operand in
            guard let operand = Double(operand) else {
                return
            }
            operandsAndOperators.operands.push(operand)
        })
        separatedOperatorsArray.forEach({ operatorValue in
            guard let operatorValue = Operator(rawValue: Character(operatorValue)) else {
                return
            }
            operandsAndOperators.operators.push(operatorValue)
        })
        return operandsAndOperators
    }
    
    static func makeOperators(from input: String) -> [String] {
        let filteredOperators: String = input.filter { Operator(rawValue: $0) != nil }
        let separatedOperators: [String] = filteredOperators.map({ String($0) })
        return separatedOperators
    }
    
    static func makeOperands(from input: String) -> [String] {
        let operators = Operator.allCases
        return operators.reduce([""]) { (array, operatorValue) in
            let separatedOperands = array.flatMap({$0.split(with: operatorValue.rawValue)})
            return separatedOperands
        }
    }
    
}
extension String {
    func split(with target: Character) -> [String] {
        let conversionString: [String] = self.split(separator: target).map({ String($0) })
        return conversionString
    }
}
