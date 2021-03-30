//
//  PrefixOperator.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/30.
//

protocol PrefixOpreator: Operator { }

enum DecimalPrefixOperator: String, PrefixOpreator {
    typealias OperandType = Double
    
    case unaryMinus = "-"
}

enum BinaryPrefixOperator: String, PrefixOpreator {
    typealias OperandType = Binary
    
    case bitwiseNOT = "~"
    case unaryMinus = "-"
}
