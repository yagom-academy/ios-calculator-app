//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 비모 on 2023/05/30.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var enqueueStack: [Element] = []
    private var dequeueStack: [Element] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
}
