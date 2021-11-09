//
//  CalculatorItem.swift
//  Calculator
//
//  Created by Seul Mac on 2021/11/09.
//

import Foundation

protocol CalculateItem {
    
}

struct CalculatorItemQueue<Element>: CalculateItem {

    var inbox: [Element] = []
    var outbox: [Element] = []
    
}
