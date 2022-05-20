//
//  StringExtension.swift
//  Calculator
//
//  Created by Baek on 2022/05/20.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map{ (value) in return String(value)}
    }
}
