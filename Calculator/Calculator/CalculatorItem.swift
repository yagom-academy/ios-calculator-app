//
//  CalculatorItem.swift
//  Calculator
//
//  Created by 천승현 on 2023/01/25.
//

protocol CalculatorItem {

}

extension String: CalculatorItem { }

extension Double: CalculatorItem { }

extension Operator: CalculatorItem { }

