//
//  String+Extensions.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/15.
//

import Foundation

extension String {
    var withoutCommas: String {
        return self.filter { $0 != "," }
    }
    
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
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        if inputOperand.contains(".") {
            return try inputOperand.convertToPresentableWithDot()
        }
        
        return numberFormatter.string(for: operand)
    }
    
    private func convertToPresentableWithDot() throws -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        let dotFront = self.split(with: ".")[0]
        guard let formattedDotFront = numberFormatter.string(for: Double(dotFront)) else {
            throw NumberFormatError.numberFormatFailed
        }
        
        if self.split(with: ".").count == 1 {
            return formattedDotFront + "."
        }
        
        let dotBack = self.split(with: ".")[1]
        
        return formattedDotFront + "." + dotBack
    }
}
