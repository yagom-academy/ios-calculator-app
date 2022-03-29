//  StringType.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/29

import Foundation

extension String {
    static var zero: String { "0" }
    static var doubleZero: String { "00" }
    static var dot: String { "." }
    static var empty: String { "" }
    static var nan: String { "NaN" }
    
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: "\(target)")
    }
}
