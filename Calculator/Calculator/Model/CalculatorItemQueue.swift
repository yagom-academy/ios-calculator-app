//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/25.
//

struct CalculatorItemQueue: CalculateItem {
    private var userInputItems = List<String>()
    private var operationResultQueue = List<Double>()
    private var operationResult: Double = 0
    
    var userInputDataCount: Int {
        return userInputItems.count
    }
    
    var operationResultCount: Int {
        return operationResultQueue.count
    }
    
    mutating func enqueueUserInputData(_ data: String) {
        let node = Node(data)
        userInputItems.push(node)
    }
    
    mutating func dequeueUserInputData() -> Node<String>? {
        return userInputItems.removeLast()
    }
    
    mutating func enqueueOperationResultQueue(_ data: Double) {
        let node = Node(data)
        operationResultQueue.push(node)
    }
    
    mutating func dequeueOperationResultQueue() -> Node<Double>? {
        return operationResultQueue.removeLast()
    }
}


