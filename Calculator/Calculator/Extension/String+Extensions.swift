//
//  String+Extensions.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/14.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let splittedSubstrings = self.split(separator: target)
        return splittedSubstrings.map { String($0) }
    }
}
