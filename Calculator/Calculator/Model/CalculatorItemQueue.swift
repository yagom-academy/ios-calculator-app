//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Eunsoo KIM on 2021/11/09.
//

import Foundation

struct CalculatorItemQueue: CalculateItem {
    let computingValueList = LinkedList<Double>()
    let operatorList = LinkedList<String>()
    
    func enqueue(_ computingValue: Double, _ operator: String) {
        computingValueList.append(computingValue)
        operatorList.append(`operator`)
    }
    
    func dequeue() -> (Double, String) {
        guard let dequeuedValue = computingValueList.removeFirst(),
              let dequeuedOperator = operatorList.removeFirst() else {
            return (0, "")
        }
        
        return (dequeuedValue.value, dequeuedOperator.value)
        
    }
}
