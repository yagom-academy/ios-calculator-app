//
//  StringExtension.swift
//  Calculator
//
//  Created by Jae-hoon Sim on 2021/11/11.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        self.split(separator: target).map { String($0) }
    }
}
