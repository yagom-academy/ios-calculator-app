//
//  NumberFormatGenerator.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/24.
//

import Foundation

struct CustomNumberFormatter {
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        return numberFormatter
    }()
    
    func convertToPresentableFormat(from number: Double) throws -> String? {
        return numberFormatter.string(for: number)
    }
    
    func convertStringToPresentableFormat(from string: String) throws -> String? {
        guard let operand = Double(string) else {
            throw NumberFormatError.typeCastingFailed
        }
        
        if string.contains(".") {
            return try convertToPresentableWithDot(inputOperand: string)
        }
        
        return numberFormatter.string(for: operand)
    }
    
    private func convertToPresentableWithDot(inputOperand: String) throws -> String {
        let splittedNumberArray = inputOperand.split(with: ".")
        let dotFront = splittedNumberArray[0]
        guard let formattedDotFront = numberFormatter.string(for: Double(dotFront)) else {
            throw NumberFormatError.numberFormatFailed
        }
        
        if splittedNumberArray.count == 1 {
            return formattedDotFront + "."
        }
        let dotBack = splittedNumberArray[1]
        
        return formattedDotFront + "." + dotBack
    }
}
