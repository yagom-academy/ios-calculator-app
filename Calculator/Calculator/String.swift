//
//  String.swift
//  Calculator
//
//  Created by Danny on 2/20/24.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        var splitString: [String] = []
        var splitOperandsAndOperators: String = ""
        
        for i in self {
            if i == target {
                splitString.append(splitOperandsAndOperators)
                splitOperandsAndOperators = ""
            } else {
                splitOperandsAndOperators.append(String(i))
            }
        }
        
        splitString.append(splitOperandsAndOperators)
            
        return splitString
    }
}
