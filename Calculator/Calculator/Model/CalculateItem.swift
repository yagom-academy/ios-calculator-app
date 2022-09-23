//
//  CalculateItem.swift
//  Calculator
//
//  Created by meme on 19/9/2022.
//

protocol CalculateItem {
    
}

extension String {
    
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}

extension Double: CalculateItem {
    
}
