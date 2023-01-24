//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by kimseongjun on 2023/01/24.
//

import Foundation

protocol CalculatorItem {
    
    var calculatedValue: Double { get set }
    
    mutating func add()
    mutating func substract()
    mutating func multiply()
    mutating func devide()
    mutating func calculate()
}

protocol Queue {
    associatedtype Element
    var queue: [Element?] { get set }
    var head: Int { get set }
    var isEmpty: Bool { get set }
    
    mutating func enqueue(element: Element)
    mutating func dequeue() -> Element?
}

struct CalculatorItemQueue<Element>: CalculatorItem, Queue {
    var head: Int
    
    var isEmpty: Bool
    
    func enqueue() {
        <#code#>
    }
    
    func dequeue() -> Element? {
        <#code#>
    }
    
    var calculatedValue: Double
    
    mutating func add() {
        <#code#>
    }
    
    mutating func substract() {
        <#code#>
    }
    
    mutating func multiply() {
        <#code#>
    }
    
    mutating func devide() {
        <#code#>
    }
    
    mutating func calculate() {
        <#code#>
    }
    
    
    var queue: [Element?] = []
    
    mutating func enqueue(element: Element) {
        queue.append(element)
    }
}
