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
    
    var numberFormatter: Formatter {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp

        numberFormatter.maximumSignificantDigits = 20
        
        return numberFormatter
    }
}

// MARK: - internal method

extension CalculatorExpressionController {
    mutating func calculate() -> String? {
        var formula: Formula = ExpressionParser.parse(from: expressionWrapper)
        let calculatedValue: Decimal = Decimal(formula.result())
        
        expressionWrapperInit()
        
        return numberFormatter.string(for: calculatedValue)
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
