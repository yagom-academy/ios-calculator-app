//
//  StringExtension.swift
//  Calculator
//
//  Created by Charles on 2023/10/08.
//
import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return components(separatedBy: String(target))
    }
}
