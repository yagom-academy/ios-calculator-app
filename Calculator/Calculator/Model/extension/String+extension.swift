//
//  String+extension.swift
//  Calculator
//
//  Created by 예거 on 2021/11/16.
//

extension String {
    
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: target.description)
    }
}
