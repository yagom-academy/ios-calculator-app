//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by DuDu on 2022/03/14.
//

struct CalculatorItemQueue<Element: CalculateItem> {
    private var front: Node<Element>?
    private var rear: Node<Element>?
    
    init() {
        front = Node<Element>()
        rear = Node<Element>()
        
        front?.next = rear
        rear?.prev = front
    }
    
    var isEmpty: Bool {
        return front?.next === rear
    }
    
    func enqueue(_ data: Element) {
        let newNode = Node(data: data)
        let previousNode = rear?.prev
        
        previousNode?.next = newNode
        newNode.prev = previousNode
        
        newNode.next = rear
        rear?.prev = newNode
    }
    
    func dequeue() -> Element? {
        if isEmpty {
            return nil
        }
        
        let targetNode = front?.next
        let targetData = targetNode?.data
        
        let nextNode = targetNode?.next
        
        front?.next = nextNode
        nextNode?.prev = front
        
        return targetData
    }
    
    mutating func removeAll() {
        front = Node<Element>()
        rear = Node<Element>()
        
        front?.next = rear
        rear?.prev = front
    }
    
    func allElement() -> [Element] {
        var elements = [Element]()
        var current = front?.next
        
        while current !== rear {
            guard let data = current?.data else {
                break
            }
            
            elements.append(data)
            current = current?.next
        }
        
        return elements
    }
}

