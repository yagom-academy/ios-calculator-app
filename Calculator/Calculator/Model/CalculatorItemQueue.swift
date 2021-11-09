//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/09.
//

import Foundation

typealias List = Array

protocol CalculateItem {
}

struct CalculatorItemQueue<T>: CalculateItem {
    private var items: List<T>
    
    
    init() {
        self.items = List<T>()
    }
    
    mutating func insert(_ item: T) {
        self.items.append(item)
    }
    
    @discardableResult
    mutating func delete() -> T? {
        guard items.isEmpty == false else { return nil }
        return items.removeFirst()
    }
}
