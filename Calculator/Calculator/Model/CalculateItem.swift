//
//  CalculateItem.swift
//  Calculator
//
//  Created by Eddy on 2022/03/16.
//

import Foundation

protocol CalculateItem {
    // empty
}


extension Double: CalculateItem {
   // empty
}

extension String: CalculateItem {
    func split(with target: Character) -> [String] {
        let operatorNumber = target.description.components(separatedBy: " ")
        return operatorNumber
    }
}
