//
//  String_Extension.swift
//  Calculator
//
//  Created by 1 on 2021/11/15.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let splitedSustring = self.split(separator: target)
        let stringArray = splitedSustring.map{String($0)}
        return stringArray
    }
}
