//
//  ExtensionString.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target) as? [String] ?? []
    }
}
