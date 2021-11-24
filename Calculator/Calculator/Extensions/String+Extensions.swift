//
//  String+Extensions.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/15.
//

import Foundation

extension String {
    var isZero: Bool {
        return self == "0"
    }
    
    var isNotZero: Bool {
        return self != "0"
    }
    
    func split(with target: Character) -> [String] {
        return self
            .split(separator: target)
            .compactMap { String($0) }
    }

    func convertNumberToPresentableFormat() throws -> String? {
        let inputOperand = self
        guard let operand = Double(inputOperand) else {
            throw NumberFormatError.typeCastingFailed
        }
        
        if inputOperand.contains(".") {
            return try inputOperand.convertToPresentableWithDot()
        }
        let numberFormatter = NumberFormatGenerator.createNumberFormatter()
        
        return numberFormatter.string(for: operand)
    }
    
    private func convertToPresentableWithDot() throws -> String {
        let numberFormatter = NumberFormatGenerator.createNumberFormatter()
        let splittedNumberArray = self.split(with: ".")
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
