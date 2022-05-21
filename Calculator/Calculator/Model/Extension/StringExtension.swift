//
//  StringExtension.swift
//  Calculator
//
//  Created by yeton on 2022/05/20.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
