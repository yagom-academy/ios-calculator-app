//
//  CalculatorExpressionController.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/19.
//

import UIKit

struct CalculatorExpressionController {
    
    var expression: String = ""
    
    // stackView 만들기
    mutating func addExpression(signValue: String?, numberValue: String) -> UIStackView {
        let expressionStackView = UIStackView()
        
        let signLabel = ExpressionLabel()
        let numberLabel = ExpressionLabel()
        
        signLabel.text = signValue
        numberLabel.text = numberValue
        
        if let signValue = signValue {
            expression += signValue + numberValue
        } else {
            expression += numberValue
        }
        
        expressionStackView.addArrangedSubview(signLabel)
        expressionStackView.addArrangedSubview(numberLabel)
        
        return expressionStackView
    }
    
    func changeNumberSign(numberValue: String) -> String {
        return numberValue.hasPrefix("-") ? numberValue.filter { $0.isNumber } : "-" + numberValue
    }
}
