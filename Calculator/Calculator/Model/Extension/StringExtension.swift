//
//  StringExtension.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/12.
//

import Foundation

extension String {
    func split(with targert: Character) -> [String] {
        self.split(separator: targert).map { String($0) }
    }
}
