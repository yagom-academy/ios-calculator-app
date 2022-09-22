//
//  CalculateItem.swift
//  Calculator
//
//  Created by jin on 9/19/22.
//

protocol CalculateItem {
    
}

extension String {
    
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}

extension Double : CalculateItem {}
