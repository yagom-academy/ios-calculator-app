//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Hyungmin Lee on 2023/05/30.
//

protocol CalculateItem { }

protocol Queueable {
    associatedtype Element
    
    var isEmpty: Bool { get }
    
    init()
    mutating func enqueue(element: Element)
    mutating func dequeue() -> Element?
}

struct CalculatorItemQueue<Element: CalculateItem>: Queueable {
    private var head: Item<Element>?
    private var tail: Item<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func enqueue(element: Element) {
        let item = Item(element)
        
        if head == nil {
            head = item
            tail = item
            return
        }
        
        tail?.next = item
        tail = item
    }
    
    mutating func dequeue() -> Element? {
        guard head != nil else { return nil }
        
        let element = head?.element
        
        head = head?.next
        return element
    }
}

// MARK: - Test Func
extension CalculatorItemQueue {
    func returnListValue() -> [Element]? {
        guard head != nil else { return nil }
        
        var item: Item? = head
        var listArray = [Element]()
        
        while item != nil {
            guard let element = item?.element else { break }
            
            listArray.append(element)
            item = item?.next
        }
        
        return listArray
    }
}
