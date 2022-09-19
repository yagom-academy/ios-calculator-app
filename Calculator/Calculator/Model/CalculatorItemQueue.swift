//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Wonbi on 2022/09/19.
//

import Foundation

struct CalculatorItemQueue {
    var data: [CalculateItem] = []
    
    var isEmpty: Bool {
        data.isEmpty
    }
}
