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
            
            if Int(string) == nil {
                if component != "" {
                    result.append(component)
                    component = ""
                }
                
                result.append(string)
            } else {
                component += string
            }
        }
        
        result.append(component)
        
        return result
    }
}
