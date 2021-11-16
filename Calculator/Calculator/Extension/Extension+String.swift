//
//  Extension+String.swift
//  Calculator
//
//  Created by 이차민 on 2021/11/12.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }        
    }
    
    func addCommaOnEveryThreeDigits() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumSignificantDigits = 20
        guard let number = formatter.number(from: self) else {
            return nil
        }
        
        guard let result = formatter.string(from: number) else {
            return nil
        }
        
        return result
    }
}
