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

    }
}

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        
    }
    
    static func makeOperators(from input: String) -> [String] {
        let filteredOperators: String = input.filter { Operator(rawValue: $0) != nil }
        let separatedOperators: [String] = filteredOperators.map({ String($0) })
        return separatedOperators
    }
    
    static func makeOperands(from input: String) -> [String] {
        let operators = Operator.allCases
        return operators.reduce([""]) { (array, `operator`) in
            let separatedOperands = array.flatMap({$0.split(with: `operator`.rawValue)})
            return separatedOperands
    }
}

extension String {
    func split(with target: Character) -> [String] {
        
    }
}
