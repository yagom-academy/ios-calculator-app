//
//  String+Extension.swift
//  Calculator
//
//  Created by mmim.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
