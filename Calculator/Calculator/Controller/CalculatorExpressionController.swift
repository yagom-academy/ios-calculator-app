//
//  CalculatorExpressionController.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/19.
//

import UIKit

struct CalculatorExpressionController {
    
    // MARK: property
    
    var expressionWrapper: String = ""
    
    
}

// MARK: - internal method

extension CalculatorExpressionController {
    mutating func calculate() -> String? {
        var formula: Formula = ExpressionParser.parse(from: expressionWrapper)
        let calculatedValue: Decimal = Decimal(formula.result())
        
        expressionWrapperInit()
        
        return numberFormatter.string(for: calculatedValue)
    }
    
    
    
    mutating func expressionWrapperInit() {
        expressionWrapper = ""
    }
    
    func changeNumberSign(numberValue: String) -> String {
        return numberValue.hasPrefix("-") ? numberValue.filter { $0.isNumber } : "-" + numberValue
    }
}
