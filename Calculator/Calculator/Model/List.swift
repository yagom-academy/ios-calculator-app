//
//  List.swift
//  Calculator
//
//  Created by SummerCat on 2022/09/20.
//

import Foundation

class Node {
    var value: CalculateItem
    var prev: Node?
    var next: Node?
    
    init(value: CalculateItem) {
        self.value = value
    }
}

struct List {
    var front: Node?
    var rear: Node?
    
    mutating func add(node: Node) {
        if rear == nil {
            self.front = node
            self.rear = node
            return
        }
        
        rear?.next = node
        node.prev = rear
        self.rear = node
    }
}

struct CalculatorItemQueue2<T: CalculateItem> {
    var list = List()
    
    mutating func enqueue(node: Node) {
        list.add(node: node)
    }
}
