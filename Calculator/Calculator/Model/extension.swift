//
//  extension.swift
//  Calculator
//
//  Created by 김성준 on 2023/01/27.
//

extension Double: CalculateItem {
    
}

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        let splitComponent: [String] = self.split(separator: target).map{ String($0) }
        return splitComponent
    }
}
