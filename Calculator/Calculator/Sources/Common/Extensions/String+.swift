//
//  String+.swift
//  Created by 미니.
//

import Foundation

extension String {
    static var formatter = NumberFormatter()
    
    var calNumber: String {
        let numberValue = NSDecimalNumber(string: self)
        
        Self.formatter.numberStyle = .decimal
        Self.formatter.maximumFractionDigits = 10
        Self.formatter.maximumIntegerDigits = 20
        Self.formatter.maximumSignificantDigits = 20
        return Self.formatter.string(from: numberValue) ?? "0"
    }
    
    func split(with target: Character) -> [String] {
        return split(separator: target, omittingEmptySubsequences: false).map { $0.description }
    }
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
