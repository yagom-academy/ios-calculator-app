//
//  String.swift
//  Calculator
//
//  Created by 이정민 on 2022/09/23.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        var result: [String] = []
        var component = ""
        
        self.forEach { character in
            let string = String(character)
            
            if character == target {
                if component != "" {
                    result.append(component)
                    component = ""
                }
                result.append(string)
                
            } else {
                component += string
            }
        }
        
        if component != "" {
            result.append(component)
        }
        
        return result
    }
}
