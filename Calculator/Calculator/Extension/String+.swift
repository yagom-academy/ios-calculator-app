//
//  String+.swift
//  Calculator
//
//  Created by jyubong on 10/12/23.
//

extension String {
    func split(with target: Character) -> [String] {
        var splitedString = split(separator: target).map{ String($0) }
        let count = splitedString.count
        
        guard count > 0 else { return [self] }
        
        for index in 0..<count - 1 {
            let insertIndex = index * 2 + 1
            splitedString.insert(String(target), at: insertIndex)
        }
        
        return splitedString
    }
}
