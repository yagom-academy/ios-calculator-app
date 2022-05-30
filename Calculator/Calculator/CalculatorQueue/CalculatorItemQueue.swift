//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/16.
//
struct CalculatorItemQueue<T: CalculatorItem> {
    private var queue = CalculatorList<T>()
    var count: Int {
        return queue.size()
    }

    mutating func enqueue(_ input: T) {
        let newNode = Node(value: input)
        self.queue.append(newNode)
    }

    mutating func dequeue() -> Node<T>? {
        if queue.isEmpty() {
            return nil
        }

        return queue.pop()
    }
}
