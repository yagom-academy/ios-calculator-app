//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Christy Lee on 2023/01/24.
//

import Foundation

struct CalculatorItemQueue<T> {
    var data = [T] ()
    init() {}
    
    var count: Int {
        return data.count
    }
    
    func isEmpty() -> Bool {
        return data.isEmpty
    }
}
