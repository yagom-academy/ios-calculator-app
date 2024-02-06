//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Jaehun Lee on 2/6/24.
//

protocol CalculateItem {
    
}

protocol QueueProtocol {
    associatedtype Element
    var count: Int { get }
    var isEmpty: Bool { get }
    var first: Element? { get }
    mutating func enqueue(element: Element)
    mutating func dequeue() -> Element?
}

struct CalculatorItemQueue<Element: CalculateItem>: QueueProtocol {
    private var list = DoublyLinkedList<Element>()
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var first: Element? {
        return list.first
    }
    
    mutating func enqueue(element: Element) {
        
    }
    
    mutating func dequeue() -> Element? {
        return nil
    }
}
