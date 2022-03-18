//
//  extension.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/17.
//

import Foundation

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        return target.description.components(separatedBy: ["+","-","/","*"])
    }
}

extension Int: CalculateItem {
    // Empty
}

extension Double: CalculateItem {
    // Empty
}
