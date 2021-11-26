//
//  CalculatorManager.swift
//  Calculator
//
//  Created by 이승재 on 2021/11/15.
//

import Foundation

struct CalculatorManager {
    private (set) var displayingResult : Bool
    private (set) var isTypingOperand : Bool

    init(displayingResult: Bool, isTypingOperand: Bool){
        self.displayingResult = displayingResult
        self.isTypingOperand = isTypingOperand
    }
    
    func format(of numberExpression: String) -> String {
        if self.isTypingOperand {
            return numberExpression
        }
        
        let numberFormatter = NumberFormatter()
        let numberWithoutDecimal = numberExpression
            .replacingOccurrences(of: ",", with: "")
        
        guard let number = Double(numberWithoutDecimal) else {
            return "0"
        }
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 15
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.roundingMode = .halfUp
        
        guard let formattedNumber = numberFormatter
                .string(from: NSNumber(value: number)) else {
            return "0"
        }
        
        return formattedNumber
    }
    
    mutating func setDisplayingResultStatus(to status: Bool) {
        displayingResult = status
    }
    
    mutating func setIsTypingOperandStatus(to status: Bool) {
        isTypingOperand = status
    }
}
