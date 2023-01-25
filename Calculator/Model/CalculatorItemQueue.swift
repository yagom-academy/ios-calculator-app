//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by kokkilE on 2023/01/25.
//

struct CalculatorItemQueue: CalculateItem {
    var userInputDataQueue = List<String>()
    var operationResultQueue = List<Double>()
    var operationResult: Double = 0
    
    var userInputDataCount: Int {
        return userInputDataQueue.count
    }
    
    var operationResultCount: Int {
        return operationResultQueue.count
    }
    
    mutating func enqueueUserInputData(_ data: String) {
        let node = Node(data)
        userInputDataQueue.push(node)
    }
    
    mutating func dequeueUserInputData() -> Node<String>? {
        return userInputDataQueue.removeLast()
    }
    
    mutating func enqueueOperationResultQueue(_ data: Double) {
        let node = Node(data)
        operationResultQueue.push(node)
    }
    
    mutating func dequeueOperationResultQueue() -> Node<Double>? {
        return operationResultQueue.removeLast()
    }
}


