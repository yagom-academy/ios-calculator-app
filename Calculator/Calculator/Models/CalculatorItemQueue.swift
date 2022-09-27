//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Kyo on 2022/09/19.
//

final class CalculatorItemQueue<Element: CalculateItem> {
    private var queue: LinkedList<Element>! = LinkedList()
    
    func first() -> Element? {
        return queue.bringHead()
    }
    
    func last() -> Element? {
        return queue.bringTail()
    }
    
    func enqueue(_ data: Element) {
        queue.append(data: data)
    }
    
    func dequeue() -> Element? {
        return queue.removeFirst()
    }
    
    func count() -> Int {
        return queue.bringListCount()
    }
    
    func removeAll() {
        queue.removeAll()
    }
}
