//
//  StringExtension.swift
//  Calculator
//
//  Created by 권나영 on 2021/11/18.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let result = self.split(separator: target).map{ String($0) }
        return result
    }
}
