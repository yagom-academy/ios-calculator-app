//
//  StringExtension.swift
//  Calculator
//
//  Created by Harry, Goat on 2023/02/07.
//

import Foundation

extension String {

    func split(someOperator: Character) -> [String] {

        var result: [String] = []
        
        result = self.split(separator: someOperator).map{String($0)}
        
        return result
    }
}
