//
//  CalculateItem.swift
//  Calculator
//
//  Created by 1 on 2021/11/09.
//

import Foundation

protocol CalculateItem {
}

enum Operator: CalculateItem {
    case plus, minus, multiply, divide, equal
}

extension Double: CalculateItem {
}
