//
//  String.swift
//  Calculator
//
import Foundation

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
