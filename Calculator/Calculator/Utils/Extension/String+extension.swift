//
//  String+extension.swift
//  Calculator
//
//  Created by Eddy on 2022/03/28.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return split(separator: target).map { String($0) }
    }
}

extension Optional where Wrapped == String {
    var unwrapped: String {
        guard let result = self else { return "" }
        return result
    }
}
