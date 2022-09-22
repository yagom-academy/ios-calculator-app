//
//  LinkedList.swift
//  Calculator
//
//  Created by Kyo on 2022/09/19.
//

struct LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    private var count: Int = 0
    
    func bringHead() -> T? {
        guard let head = head else { return nil }
        return head.bringNodeData()
    }
    
    func bringTail() -> T? {
        guard let tail = tail else { return nil }
        return tail.bringNodeData()
    }
    
    func bringListCount() -> Int {
        return count
    }
    
    mutating func append(data: T) {
        let node: Node<T> = Node(data)
        
        if count == 0 {
            head = node
        } else {
            tail?.setNextNode(node: node)
        }
        
        count += 1
        tail = node
    }
    
    mutating func removeFirst() -> T? {
        if count == 0 {
            return nil
        } else {
            let removeItem: Node<T>? = head
            self.head = head?.bringNextNode()
            count -= 1
            
            return removeItem?.bringNodeData()
        }
    }
    
    mutating func removeAll() {
        count = 0
        head = nil
        tail = nil
    }
}
