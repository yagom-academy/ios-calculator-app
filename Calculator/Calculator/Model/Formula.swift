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
        
    }
    
    static func makeOperands(from input: String) -> [String] {
        
    }
}

extension String {
    func split(with target: Character) -> [String] {
        
    }
}
