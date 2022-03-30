//
//  extension+String.swift
//  Calculator
//
//  Created by Red on 2022/03/21.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
    
    func changeDecimalFormat() -> String {
        guard self != "nan" else { return "NaN" }
        
        let numberFomatter = NumberFormatter()
        numberFomatter.numberStyle = .decimal
        
        let number = numberFomatter.number(from: self) ?? 0
        let changedNumber = numberFomatter.string(from: number) ?? ""
        
        return changedNumber
    }
}
