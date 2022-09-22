//
//  ArrayExtension.swift
//  Calculator
//
//  Created by Gundy on 2022/09/21.
//

public extension Array {
    mutating func popFirst() -> Element? {
        return self[self.indices].popFirst()
    }
}
