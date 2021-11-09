//
//  Calculator.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

class Node {
    var data: CalcultorItem?
    var next: Node?
    
    init(data: CalcultorItem?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList {
    private var head: Node?
    
    mutating func append(data: CalcultorItem?) {
        if head == nil {
            self.head = Node(data: data)
            return
        }
        
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = Node(data: data)
    }
    
    mutating func removeFrist() -> CalcultorItem? {
        if head == nil { return nil }
        
        var removedData: CalcultorItem? = nil
        if head?.next == nil {
            removedData = head?.data
            self.head = head?.next
        }
        return removedData
    }
    
    mutating func clear() {
        self.head = nil
    }
    
    var isEmpty: Bool {
        if head == nil { return true }
        return false
    }
    
    func searchAll() -> [CalcultorItem] {
        var searchedList:[CalcultorItem] = []
        if head == nil { return [] }
        
        var node = head
        if let nodeData = node?.data {
            searchedList.append(nodeData)
        }
        
        while node?.next != nil {
            node = node?.next
            if let nodeData = node?.data {
                searchedList.append(nodeData)
            }
        }
        return searchedList
    }
}

struct CalculatorItemQueue {
    var queueList: LinkedList = LinkedList()
    
    mutating func enqueue(item: CalcultorItem?) {
        guard let item = item else {
            return
        }
        queueList.append(data: item)
    }
    
    mutating func dequeue() -> CalcultorItem? {
        if queueList.isEmpty {
            return nil
        }
        let removedItem = queueList.removeFrist()

        return removedItem
    }

    mutating func clearQueue() {
        queueList.clear()
    }
}

struct NumberItem: CalcultorItem {
    let data: Int
    
    var dataToString: String {
        return String(describing: self.data)
    }
}

enum OperatorItem: CalcultorItem {
    case add
    case substract
    case multiple
    case divide
    
    var operatorSymbol: String {
        switch self {
        case .add:
            return "+"
        case .substract:
            return "-"
        case .multiple:
            return "*"
        case .divide:
            return "/"
        }
    }
}

protocol CalcultorItem { }
