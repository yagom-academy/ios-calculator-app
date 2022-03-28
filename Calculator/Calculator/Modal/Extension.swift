//
//  Extension.swift
//  Calculator
//
//  Created by 파프리on 2022/03/28.
//

import Foundation

extension Double: CalculateItem {
    
}

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
