//
//  Node.swift
//  Calculator
//
//  Created by SeoDongyeon on 2022/03/15.
//

import Foundation

final class CalculatorNode<T> {
    var value: T
    var next: CalculatorNode?
    
    init(value: T) {
        self.value = value
    }
}
