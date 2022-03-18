//
//  Formula.swift
//  Calculator
//
//  Created by 이시원 on 2022/03/18.
//

import Foundation

struct Formula {
    let operands: CalculatorItemQueue<LinkdeList<Int>>
    let operators: CalculatorItemQueue<LinkdeList<>>
}
