//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 우롱차 on 2022/03/15.
//

import Foundation



class CalculatorItemQueue {
    var queue: [Item] = []
    
    func enqueue(number: Float, operation: String) {
        queue.append(Item(number: number, operation: operation))
    }
    
    func dequeue() -> Item{
        let returnValue = queue[0]
        queue.remove(at: 0)
        return returnValue
    }
}




