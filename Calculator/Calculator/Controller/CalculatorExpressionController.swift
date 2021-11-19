//
//  CalculatorExpressionController.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/19.
//

import UIKit

struct CalculatorExpressionController {
    
    var expressionWrapper: String = ""
    
    mutating func calculate(expression: String) -> String {
        expressionWrapper += expression
        
        var formula: Formula = ExpressionParser.parse(from: expressionWrapper)
        let calculatedValue: Double = formula.result()
        
        expressionWrapperInit()
        
        return String(calculatedValue)
    }
    
    mutating func addExpression(signValue: String?, numberValue: String) -> UIStackView {
        let expressionStackView = UIStackView()
        
        let signLabel = ExpressionLabel()
        let numberLabel = ExpressionLabel()
        
        signLabel.text = signValue
        numberLabel.text = numberValue
        
        if let signValue = signValue {
            expressionWrapper += signValue + numberValue
        } else {
            expressionWrapper += numberValue
        }
        
        expressionStackView.addArrangedSubview(signLabel)
        expressionStackView.addArrangedSubview(numberLabel)
        
        return expressionStackView
    }
    
    mutating func expressionWrapperInit() {
        expressionWrapper = ""
    }
    
    func changeNumberSign(numberValue: String) -> String {
        return numberValue.hasPrefix("-") ? numberValue.filter { $0.isNumber } : "-" + numberValue
    }
    
    
}
