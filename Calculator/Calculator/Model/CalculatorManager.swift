//
//  CalculatorManager.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/15.
//

import Foundation

struct CalculatorManager {
    private (set) var calculatingFinish : Bool
    private (set) var isTypingOperand : Bool
    
    private let numberFormatter = NumberFormatter()

    init(calculatingFinish: Bool, isTypingOperand: Bool){
        self.calculatingFinish = calculatingFinish
        self.isTypingOperand = isTypingOperand
    }
    
    func format(of numberExpression: String) -> String {
        if self.isTypingOperand {
            return numberExpression
        }
        
        let numberExpressionWithoutDecimal = numberExpression
            .replacingOccurrences(of: ",", with: "")
        guard let number = Double(numberExpressionWithoutDecimal) else {
            return "0"
        }
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        
        guard let formattedNumber = numberFormatter
                .string(from: NSNumber(value: number)) else {
            return "0"
        }
        
        return round(formattedNumber)
    }
    
    mutating func setCalculatingFinishStatus(to status: Bool) {
        calculatingFinish = status
    }
    
    mutating func setIsTypingOperandStatus(to status: Bool) {
        isTypingOperand = status
    }
    
    private func round(_ number: String) -> String {
        let roundBehavior = NSDecimalNumberHandler(roundingMode: .plain, scale: 15,
                                                   raiseOnExactness: false,
                                                   raiseOnOverflow: false,
                                                   raiseOnUnderflow: false,
                                                   raiseOnDivideByZero: false)
        
        let roundedNumber = NSDecimalNumber(string: number)
                            .rounding(accordingToBehavior: roundBehavior)
        
        return String(describing: roundedNumber)
    }
}
