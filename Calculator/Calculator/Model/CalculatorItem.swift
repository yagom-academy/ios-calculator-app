//
//  CalculatorItem.swift
//  Calculator
//
//  Created by 이호영 on 2021/11/09.
//

import Foundation

struct NumberItem: CalculateItem {
    let data: Int
}

enum OperatorItem: CalculateItem {
    case add
    case substract
    case multiple
    case divide
}

protocol CalculateItem { }

