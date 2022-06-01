//
//  Double+extension.swift
//  Calculator
//
//  Created by 김동용 on 2022/05/30.
//

import Foundation

extension Double: CalculateItem {
    func formatText() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        guard let formattedResult = numberFormatter.string(for: self) else {
            return OperatorError.unknown.errorDescription
        }
        
        return formattedResult
    }
}
