//
//  CalculatorManager.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/15.
//

import Foundation

struct CalculatorManager {
    var calculatingFinish : Bool
    var isTypingOperand : Bool
    
    private let numberFormatter = NumberFormatter()

    init(calculatingFisnish: Bool, isTypingOperand: Bool){
        self.calculatingFinish = calculatingFisnish
        self.isTypingOperand = isTypingOperand
    }
    
    func format(of numberExpression: String) -> String {
        let numberExpressionWithoutDecimal = numberExpression
            .replacingOccurrences(of: ",", with: "")
        guard let number = Double(numberExpressionWithoutDecimal) else {
            return "0"
        }
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        
        if calculatingFinish {
            numberFormatter.minimumSignificantDigits = 1
        }
        
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) else {
            return "0"
        }
        
        return formattedNumber
    }
}
