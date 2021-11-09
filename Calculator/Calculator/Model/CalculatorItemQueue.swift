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
    
}
