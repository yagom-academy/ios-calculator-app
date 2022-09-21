//
//  Array+.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/21.
//

extension Array where Element == CalculateItem {
    subscript (safe index: Int) -> Element? {
        if index > startIndex && index < endIndex {
            return self[index]
        }
        return nil
    }
}
