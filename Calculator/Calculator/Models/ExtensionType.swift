//
//  ExtensionType.swift
//  Calculator
//
//  Created by Toy on 10/5/23.
//

import Foundation

extension Double: CalculateItem { }

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
