//
//  LinkedList.swift
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
        if head == nil {
            return nil
        }
        
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
        return head == nil ? true : false 
    }
    
    func searchAll() -> [CalcultorItem] {
        var searchedList:[CalcultorItem] = []
        if head == nil {
            return []
        }
        
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
