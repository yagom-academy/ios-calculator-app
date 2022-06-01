//
//  String+extension.swift
//  Calculator
//
//  Created by hugh,bard on 2022/05/30.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
    
    func formatNumber() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        guard let numberFormattedResult = numberFormatter.number(from: self) else {
            return OperatorError.unknown.errorDescription
        }
        guard let formattedResult = numberFormatter.string(from: numberFormattedResult) else {
            return OperatorError.unknown.errorDescription
        }
        return formattedResult
    }
}
