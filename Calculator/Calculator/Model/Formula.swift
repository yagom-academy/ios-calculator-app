//
//  Formula.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/17.
//

import Foundation

struct Formula<T: CalculateItem> {
    let operands: CalculatorItemQueue<T>
    let operators: CalculatorItemQueue<T>
}
