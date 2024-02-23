//
//  StringExtension.swift
//  Calculator
//
//  Created by H on 2/15/24.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
