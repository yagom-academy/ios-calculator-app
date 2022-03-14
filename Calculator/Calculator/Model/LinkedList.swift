//
//  LinkedList.swift
//  Calculator
//
//  Created by DuDu on 2022/03/14.
//

struct LinkedList<Element> {
    private var head: Node<Element>?
    private var tail: Node<Element>?
    
    init() {
        head = Node<Element>()
        tail = Node<Element>()
        
        head?.next = tail
        tail?.prev = head
    }
    
    var isEmpty: Bool {
        return head?.next === tail
    }
    
    func append(_ data: Element) {
        let newNode = Node(data: data)
        let previousNode = tail?.prev
        
        previousNode?.next = newNode
        newNode.prev = previousNode
        
        newNode.next = tail
        tail?.prev = newNode
    }
    
    func removeFirst() -> Element? {
        if isEmpty {
            return nil
        }
        
        let targetNode = head?.next
        let targetData = targetNode?.data
        
        let nextNode = targetNode?.next
        
        head?.next = nextNode
        nextNode?.prev = head
        
        return targetData
    }
    
    func allElement() -> [Element] {
        var elements = [Element]()
        var current = head?.next
        
        while current !== tail {
            guard let data = current?.data else {
                break
            }
            
            elements.append(data)
            current = current?.next
        }
        
        return elements
    }
}
