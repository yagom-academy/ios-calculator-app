//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 김태훈 on 2022/03/15.
//

struct CalculatorItemQueue<T> {
    private var list: [T?] = []
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public var count: Int {
        return list.count
    }
}


