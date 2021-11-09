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
    
    mutating func insert(_ item: T) -> Bool {
        self.items.append(item)
        return true
    }
    
    mutating func delete() -> T? {
        guard items.isEmpty == false else { return nil }
        return items.removeFirst()
    }
}
