//
//  String+.swift
//  Calculator
//
//  Created by jyubong on 10/12/23.
//

extension String {
    func split(with target: Character) -> [String] {
        let seperator = String(target)
        var splitedString = components(separatedBy: seperator)
        let lastIndex = splitedString.count - 1
        
        for index in 0..<lastIndex {
            let insertIndex = index * 2 + 1
            splitedString.insert(seperator, at: insertIndex)
        }
        
        return splitedString
    }
}
