//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 재재 on 2022/05/18.
//

import Foundation

struct CalculatorItemQueue<T: CalculateItem> {
    
    private var firstQueue: [T] = []
    private var secondQueue: [T] = []
    
    var count: Int {
        return firstQueue.count + secondQueue.count
    }
}
