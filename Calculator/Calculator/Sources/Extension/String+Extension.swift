//
//  String+Extension.swift
//  Calculator
//
//  Created by 재재, Kay on 2022/05/23.
//

import Foundation

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        let converted = String(target)
        let replaced = self.replacingOccurrences(of: converted, with: " \(converted) ")
        let splited = replaced.split(separator: " ").map { String($0) }
        return splited
    }
    func isNotEmpty() -> Bool {
        if self.isEmpty {
            return false
        } else {
            return true
        }
    }
    func notContains(_ string: String) -> Bool {
        if self.contains(string) {
            return false
        } else {
            return true
        }
    }
}
