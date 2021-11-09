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
    var numbers = CalculatorQueue<Double>().queue
    var operators = CalculatorQueue<String>().queue
    
    mutating func appendItem<T>(_ input: T) {
        if input is Double {
            numbers.append(input as! Double)
        } else if input is String {
            operators.append(input as! String)
        } else if input is Int {
            let intInput = input as! Int
            
            numbers.append(intInput.doubleValue)
        }
    }
}

struct CalculatorQueue<Element>: CalculateItem {
    var queue: [Element] = []
}

extension Int {
    var doubleValue: Double {
        return round(Double(self))
    }
}
