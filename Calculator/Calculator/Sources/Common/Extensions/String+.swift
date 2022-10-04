//
//  String+.swift
//  Created by 미니.
//

import Foundation

extension String {
    static let calculatorNumberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesSignificantDigits = true
        formatter.maximumFractionDigits = 10
        formatter.maximumIntegerDigits = 20
        formatter.maximumSignificantDigits = 20
        
        return formatter
    }()
    
    func toFormattedString() -> Self? {
        let pureNumber: String? = self.replacingOccurrences(of: ",", with: "")
        return pureNumber
            .flatMap(Self.calculatorNumberFormatter.number(from:))
            .flatMap(Self.calculatorNumberFormatter.string(from:))
    }
    
    func split(with target: Character) -> [String] {
        return split(separator: target, omittingEmptySubsequences: false).map { $0.description }
    }
}
