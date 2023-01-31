//
//  Extension.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/26.
//

import Foundation

extension String {

    func split(someOperator: Character) -> [String] {

        var result: [String] = []
        
        result = self.split(separator: someOperator).map{String($0)}
        
        return result
    }
}



