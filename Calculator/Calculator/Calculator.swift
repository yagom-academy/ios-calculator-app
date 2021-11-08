//
//  Calculator.swift
//  Calculator
//
//  Created by 서녕 on 2021/11/08.
//

import Foundation

class CalculatorItemQueue<T> {
    var itemQueue = [T]
    
    func putToQueue<T>(_ value: T) {
        itemQueue.append(value)
    }
}
