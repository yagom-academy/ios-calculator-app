//
//  StringExtensions.swift
//  Calculator
//
//  Created by yeha on 2021/11/15.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        if target == Operator.add.rawValue {
            return components(separatedBy: "+")
        } else if target == Operator.subtract.rawValue {
            return components(separatedBy: "")
        } else if target == Operator.divide.rawValue {
            return components(separatedBy: "/")
        } else if target == Operator.multiply.rawValue {
            return components(separatedBy: "*")
        }
        return ["0.0"]
    }
}
