//
//  OperatorType.swift
//  Calculator
//
//  Created by Wonhee on 2020/12/08.
//

import Foundation

enum DecimalOperatorType: String, CaseIterable {
    case add = "+"
    case subtract = "-"
    case multiple = "*"
    case divide = "/"
    
    var precedence: Int {
        switch self {
        case .add, .subtract:
            return 3
        case .multiple, .divide:
            return 2
        }
    }
    
    func isPrecedence(compare: DecimalOperatorType) -> Bool {
        let operatorPrecedence = self.precedence
        let compareOperatorPrecedence = compare.precedence
        
        // compare의 우선순위가 self보다 높거나 같다면 true 낮다면 false
        return (operatorPrecedence - compareOperatorPrecedence >= 0)
    }
}

enum BinaryOperatorType: String, CaseIterable {
    case add = "+"
    case subtract = "-"
    case multiple = "*"
    case leftShift = "<<"
    case rightShift = ">>"
    case and = "AND"
    case nand = "NAND"
    case or = "OR"
    case nor = "NOR"
    case xor = "XOR"
    case not = "NOT"
    
    var precedence: Int {
        switch self {
        case .leftShift, .rightShift:
            return 1
        case .and, .nand, .multiple:
            return 2
        case .or, .nor, .xor, .add, .subtract:
            return 3
        case .not:
            return 0
        }
    }
    
    func isPrecedence(compare: BinaryOperatorType) -> Bool {
        let operatorPrecedence = self.precedence
        let compareOperatorPrecedence = compare.precedence
        
        // compare의 우선순위가 self보다 높거나 같다면 true 낮다면 false
        return (operatorPrecedence - compareOperatorPrecedence >= 0)
    }
}
