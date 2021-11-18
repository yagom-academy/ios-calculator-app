//
//  StringExtension.swift
//  Calculator
//
//  Created by 박우연 on 2021/11/16.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        self.split(separator: target).map { String($0) }
    }
}
