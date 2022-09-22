//
//  StringExtension.swift
//  Calculator
//
//  Created by Gundy on 2022/09/22.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map{ String($0) }
    }
}
