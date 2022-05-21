//
//  StringExtension.swift
//  Calculator
//
//  Created by 이예은 on 2022/05/20.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
