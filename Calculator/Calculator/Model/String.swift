//
//  String.swift
//  Calculator
//
//  Created by Danny on 2/11/24.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        var splitString: [String] = []
        var splitOperands: String = ""
        
        for i in self {
            if i == target {
                splitString.append(String(i))
            } else {
                splitOperands.append(String(i))
            }
        }
        
        splitString.append(splitOperands)
        
        return splitString
    }
}
