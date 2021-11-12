//
//  String.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/12.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        
        let result = self.filter { $0 != target }
        
        if result == self {
            return [result]
        }
        
        return [String(target),result]
    }
}
