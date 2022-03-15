//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation

struct CalculatorItemQueue {
    private var forwordStack: [CalculatorItem] = []
    private var reverseStack: [CalculatorItem] = []
}

protocol CalculatorItem {
    
}

extension Double: CalculatorItem {
    
}

enum Operator: CalculatorItem {
    case plus
    case minus
    case divide
    case multiply
}
