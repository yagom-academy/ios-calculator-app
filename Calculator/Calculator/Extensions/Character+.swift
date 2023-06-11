//
//  Character+.swift
//  Calculator
//
//  Created by Minsup on 2023/06/09.
//

extension Character {
    var isOperator: Bool {
        Operator.all.contains(self)
    }
}
