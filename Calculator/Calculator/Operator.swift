//
//  Operator.swift
//  Calculator
//
//  Created by 임성민 on 2020/12/10.
//

import Foundation

struct Operator {
    let symbol: String
    let priority: Int
    let operate: (Double, Double) -> Double
    
    init(_ symbol: String, _ priority: Int, _ operate: @escaping (Double, Double) -> Double) {
        self.symbol = symbol
        self.priority = priority
        self.operate = operate
    }
}
