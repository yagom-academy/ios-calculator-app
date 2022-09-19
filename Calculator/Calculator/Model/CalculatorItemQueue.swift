//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 이정민 on 2022/09/19.
//

struct CalculatorItemQueue: CalculateItem {
    private var queue: ItemList = ItemList()
    
    mutating func push(_ data: String) {
        queue.enqueue(data)
    }
    
    mutating func pop() -> String? {
        queue.dequeue()
    }
}
