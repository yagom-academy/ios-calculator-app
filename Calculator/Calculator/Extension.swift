//
//  Extension.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/26.
//

import Foundation

extension Double : CalculateItem { }

extension String {

    func split(someChracter: Character) -> [String] {

        var result: [String] = []
        
        result = self.split(separator: someChracter).map{String($0)}
        
        return result
    }
}



