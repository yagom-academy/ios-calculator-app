//
//  CalculateStack.swift
//  Calculator
//
//  Created by 김호준 on 2020/12/14.
//

import Foundation


struct CalculateStack<Element> {
    private var storage: [Element] = []
    public init() { }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
}
