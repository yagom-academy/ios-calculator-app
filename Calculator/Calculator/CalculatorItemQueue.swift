//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/19.
//

import Foundation

struct CalculatorItemQueue<T>: CalculatorItem {
    private(set) var input: [T] = []
    private(set) var output: [T] = []
}
