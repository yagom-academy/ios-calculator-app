//
//  Item.swift
//  Calculator
//
//  Created by Jeremy on 2022/09/20.
//

struct Item: Hashable, CalculatorItem {
    var operation: Operations?
    var sign: NumberSigns?
    var number: Double
}
