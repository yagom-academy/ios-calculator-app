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
    
    mutating func appendItem(_ item: Element) {
        array.append(item)
    }
}
