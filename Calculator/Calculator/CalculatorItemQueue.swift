//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Jaehun Lee on 2/6/24.
//

extension Double: CalculateItem {
    
}

protocol CalculateItem {
    
}

protocol QueueProtocol: DataAccessable {
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
    
    var last: Element? {
        return list.last
    }
    
    mutating func enqueue(element: Element) {
        list.addLast(element: element)
    }
    
    mutating func dequeue() -> Element? {
        return list.removeFirst()
    }
}
