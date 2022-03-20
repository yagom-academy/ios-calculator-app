//  Formula.swift
//  Calculator
//  Created by LIMGAUI on 2022/03/20

import Foundation

struct Formula {
    let operands: CalculateItemQueue<Double>
    let operators: CalculateItemQueue<String>
    
    func result() -> Double {
        0.0
    }
}
