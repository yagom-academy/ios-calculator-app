//
//  extension + String.swift
//  Calculator
//
//  Created by Red on 2022/03/21.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
