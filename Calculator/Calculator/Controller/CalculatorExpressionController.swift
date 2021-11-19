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
        let calculatedValue: Double = formula.result()
        
        expressionWrapperInit()
        
        return applyNumberFormatter(doubleValue: calculatedValue)
    }
    
    func applyNumberFormatter(doubleValue: Double) -> String? {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .halfUp

        numberFormatter.minimumIntegerDigits = decideNumberOfDigits(doubleValue).0
        numberFormatter.minimumFractionDigits = decideNumberOfDigits(doubleValue).1
        
        return numberFormatter.string(from: NSNumber(value: doubleValue))
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

// MARK: - private method

extension CalculatorExpressionController {
    private func decideNumberOfDigits(_ value: Double) -> (Int, Int) {
        let stringValue = String(value)
        
        let splitedArray = stringValue.split(separator: ".")
        let (integerDigits, fractionDigits) = (splitedArray[0].filter{ $0.isNumber }.count, splitedArray[1].count)
        
        if integerDigits > 20 {
            return (20, 0)
        } else if integerDigits + fractionDigits > 20 {
            return (integerDigits, 20 - fractionDigits)
        } else {
            return (integerDigits, fractionDigits)
        }
    }
}

