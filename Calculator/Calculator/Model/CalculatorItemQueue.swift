//
//  CalculatorItemQueue.swift
//  Calculator
//

protocol CalculateItem { }

struct LinkedList<T> {
    class Node<T>: CalculateItem {
        var value: T
        var next: Node?
        
        init(_ value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
}
