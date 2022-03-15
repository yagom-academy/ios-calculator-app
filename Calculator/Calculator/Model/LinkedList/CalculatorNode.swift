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
    weak var previous: CalculatorNode? // 순환참조를 피하기위해 약한참조 선언
    
    init(value: T) {
        self.value = value
    }
}
