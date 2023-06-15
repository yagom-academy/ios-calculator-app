//
//  String.swift
//  Calculator
//
//  Created by kangkyungmin on 2023/06/07.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
    
    var isZero: Bool {
        return self == "0"
    }
    
    var isPrime: Bool {
        return self.contains(".")
    }
    
    var convertSign: String {
        if self.hasPrefix("-") {
            return String(self.dropFirst())
        } else {
            return "-\(self)"
        }
    }
    
    var removeTrailingDot: String {
        if self.hasSuffix(".") {
            return String(self.dropLast())
        } else {
            return self
        }
    }
}
