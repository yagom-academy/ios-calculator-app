//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/16.
//
class CalculatorItemQueue: CalculatorItem {
    private var queue: CalculatorList<String>

    
    var count: Int {
        return queue.size()
    }
    
    init() {
        self.queue = CalculatorList()
    }
    
    func enQueue(_ input: String) {
        let newNode: Node<String> = Node(value: input)
        self.queue.append(newNode)
    }
    
    func deQueue() -> Node<String>? {
        if queue.isEmpty() {
            return nil
        }
        return queue.pop()
    }
    
    func removeAllQueue() {
        queue.removeAll()
    }
    
    func showHeadNode() -> Node<String>? {
        return queue.head
    }
}
