//
//  LinkedList.swift
//  Calculator
//
//  Created by Hamo on 2022/09/20.
//

struct LinkedList {
    private var head: Node?
    private var tail: Node?
    
    mutating func append(data: CalculateItem) {
        guard head != nil else {
            self.head = Node(data: data)
            self.tail = head
            return
        }
        
        let newElement = Node(data: data)
        self.tail?.setNextNode(destination: newElement)
        self.tail = newElement
    }
    
    mutating func removeFirst() -> CalculateItem? {
            let result = head?.bringData()
            
            if head?.bringNextNode() == nil {
                tail = nil
            }
            
            self.head = head?.bringNextNode()
            return result
        }
    
    mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    func bringHead() -> Node? {
        return head
    }
    
    func bringTail() -> Node? {
        return tail
    }
}

