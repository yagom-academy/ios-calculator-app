//
//  String.swift
//  Calculator
//
//  Created by kyungmin, EtialMoon on 2023/06/07.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
    
    var isZero: Bool {
        return self == "0"
    }
    
    var isFraction: Bool {
        return self.contains(".")
    }
    
    mutating func convertSign() {
        if self.hasPrefix("-") {
            self = String(self.dropFirst())
        } else {
            self = "-\(self)"
        }
    }
    
    mutating func removeTrailingDot() {
        if self.hasSuffix(".") {
            self = String(self.dropLast())
        }
    }
}
