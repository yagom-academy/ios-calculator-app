//
//  LinkedList.swift
//  Calculator
//
//  Created by Hamo on 2022/09/20.
//

struct LinkedList {
    var head: Node?
    var tail: Node?
    
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
        
}

