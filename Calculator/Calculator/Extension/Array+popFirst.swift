//
//  Array+popFirst.swift
//  Calculator
//
//  Created by Gundy on 2022/09/21.
//

extension Array {
    mutating func popFirst() -> Element? {
        return self[self.indices].popFirst()
    }
}
