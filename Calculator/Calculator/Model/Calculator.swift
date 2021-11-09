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

//class CalculatorItemQueue<Element>: CalculateItem {
//    var queue: [Element] = []
//
//
//    func appendCalculateItem(_ item: Element) {
//        queue.append(item)
//    }
//}
//
//
//class CalculatorNumberQueue: CalculateItem {
//    var numberQueue: [Double] = []
//
//    func appendNumber(_ input: Double) {
//        numberQueue.append(input)
//    }
//}
//
//class CalculatorOperatorQueue: CalculateItem {
//    var operatorQueue: [String] = []
//
//    func appendOperator(_ input: String) {
//        operatorQueue.append(input)
//    }
//}

struct CalculatorItemQueue: CalculateItem {
    var number = CalculatorQueue<Double>().queue
    var `operator` = CalculatorQueue<Character>().queue
    
    mutating func appendItem<T>(_ input: T) {
        if input is Double {
            number.append(input as! Double)
        }
    }
}

struct CalculatorQueue<Element>: CalculateItem {
    var queue: [Element] = []
}
