//
//  StringExtension.swift
//  Calculator
//
//  Created by marisol on 2022/03/18.
//

import Foundation

extension String {
    func split(with target: Character = " ") -> [String] {
        let result = self.split(separator: target).map { String($0) }
        return result
    }
}
