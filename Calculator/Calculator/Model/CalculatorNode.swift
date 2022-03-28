//
//  CalculateNode.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/28.
//

import Foundation

final class CalculatorNode<T> {
    var value: T
    var next: CalculatorNode?
    weak var previous: CalculatorNode?
    
    init(value: T) {
        self.value = value
    }
}
