//
//  String+.swift
//  Calculator
//
//  Created by jyubong on 10/12/23.
//

extension String {
    func split(with target: Character) -> [String] {
        var splitedString = split(separator: target).map{ String($0) }
        let count = splitedString.count - 1
        
        for index in 0..<count {
            splitedString.insert(String(target), at: index * 2 + 1)
        }
        
        return splitedString
    }
}
