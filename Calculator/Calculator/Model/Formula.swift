//
//  Formula.swift
//  Calculator
//
//  Created by Daehoon Lee on 2023/06/06.
//

struct Formula<DataType: CalculateItem> {
    var operands: CalculatorItemQueue<DataType>
}
