//
//  LinkedList.swift
//  Calculator
//
//  Created by Kyo on 2022/09/19.
//

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    private var count: Int = 0
    
    func bringHead() -> Element? {
        guard let head = head else { return nil }
        return head.bringNodeData()
    }
    
    func bringTail() -> Element? {
        guard let tail = tail else { return nil }
        return tail.bringNodeData()
    }
    
    func bringListCount() -> Int {
        return count
    }
    
    mutating func append(data: Element) {
        let node: Node<Element> = Node(data)
        
        if count == 0 {
            head = node
        } else {
            tail?.setNextNode(node: node)
        }
        
        count += 1
        tail = node
    }
    
    mutating func removeFirst() -> Element? {
        if count == 0 {
            return nil
        } else {
            let removeItem: Node<Element>? = head
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
