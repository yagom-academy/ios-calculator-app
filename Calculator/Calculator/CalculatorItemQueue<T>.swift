//
//  CalculatorItemQueue<T>.swift
//  Calculator
//
//  Created by unchain123 on 2022/05/18.
//

import Foundation

protocol CalculateItem {
    
}

class CalculatorItemQueue<T>: CalculateItem {
    var linkedList = LinkedList<T>()
    
    func enQueue(_ data: T) {
        linkedList.append(data: data)
    }
    
    func deQueue() {
        linkedList.remove()
    }
}
