//
//  ExtensionString.swift
//  Calculator
//
//  Created by Toy on 10/11/23.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
