//  Calculator - StringExtension.swift
//  created by vetto on 2023/01/27

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
    
    func numberFormatting() -> String {
        return ""
    }
}
