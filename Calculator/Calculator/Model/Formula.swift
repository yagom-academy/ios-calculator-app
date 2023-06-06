//
//  Formula.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/06/06.
//

struct Formula<Operand: CalculateItem, Operator: CalculateItem> {
    var operands: CalculatorItemQueue<Operand>
    var operators: CalculatorItemQueue<Operator>
}
