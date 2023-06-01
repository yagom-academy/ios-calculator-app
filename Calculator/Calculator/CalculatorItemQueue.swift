//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by idinaloq on 2023/05/29.
//

extension CalculatorItemQueue {
    func currentList() -> LinkedList<Element> {
        return list
    }
}

struct CalculatorItemQueue<Element: CalculateItem> {
    private var list: LinkedList<Element> = LinkedList()
    
    mutating func enqueue(_ value: Element) {
        list.append(data: value)
    }
    
    mutating func dequeue() -> Element? {
        let removedData = list.removeFirst()
        return removedData
    }
    
    mutating func removeAll() {
        list.removeAll()
    }
}
