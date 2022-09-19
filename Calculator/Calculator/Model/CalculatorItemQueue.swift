//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by smfc on 19/9/2022.
//

struct CalculatorItemQueue<T>: CalculateItem {
    var queue: [T?] = []
    var head: Int = 0
    
}
