//  Split.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/21

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target, maxSplits: 1).map(String.init)
    }
}
