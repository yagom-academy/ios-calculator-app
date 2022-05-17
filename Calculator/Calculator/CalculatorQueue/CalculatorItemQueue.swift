//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/16.
//
class CalculatorItemQueue: CalculatorItem {
    private var queue: CalculatorList<String> = CalculatorList()
    var count: Int {
        return queue.size()
    }
    
    func enQueue(_ input: String) {
        let newNode = Node(value: input)
        self.queue.append(newNode)
    }
    
    func deQueue() -> Node<String>? {
        if queue.isEmpty() {
            return nil
        }
        return queue.pop()
    }
    
    func removeAll() {
        queue.removeAll()
    }
}
