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

struct CalculatorItemQueue: CalculateItem {
    var number = CalculatorQueue<Double>().queue
    var `operator` = CalculatorQueue<String>().queue
    
    mutating func appendItem<T>(_ input: T) {
        if input is Double {
            number.append(input as! Double)
        } else if input is String {
            `operator`.append(input as! String)
        }
    }
}

struct CalculatorQueue<Element>: CalculateItem {
    var queue: [Element] = []
}
