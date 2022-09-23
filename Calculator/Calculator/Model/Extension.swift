//
//  Extension.swift
//  Calculator
//
//  Created by 김인호 on 2022/09/22.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let result = self.components(separatedBy: String(target))
        return result
    }
}

extension Double: CalculateItem {
    
}
