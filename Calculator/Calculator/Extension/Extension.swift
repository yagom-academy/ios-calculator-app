//
//  Extension.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/09.
//

import Foundation

extension Double: CalculateItem {
    
}

extension String {
    func split(with target: Character) -> [String] {
        let string = self.split(separator: target)
        guard let aa = string as? [String] else {
            return []
        }
        return aa
    }
}
