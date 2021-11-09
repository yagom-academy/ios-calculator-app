//
//  Calculator.swift
//  Calculator
//
//  Created by 양호준 on 2021/11/08.
//

import Foundation
import UIKit

protocol CalculateItem {
    
}

struct CalculatorItemQueue<Element>: CalculateItem {
    var array: [Element] = []
    var reversedArray: [Element] = []
    
    mutating func appendItem(_ item: Element) {
        array.append(item)
    }
    
    mutating func removeItem() throws {
        if array.isEmpty {
            throw QueueError.emptyArray
        }
        reversedArray = array.reversed()
        reversedArray.removeLast()
        array = reversedArray.reversed()
    }
    
    mutating func removeAllItem() {
        array.removeAll()
    }
}

class OperatorsItemQueue {
    var operators = CalculatorItemQueue<Character>()
}

class OperandsItemQueue {
    var operands = CalculatorItemQueue<Double>()
}
