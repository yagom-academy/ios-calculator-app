//
//  PrefixOperator.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/30.
//

protocol PrefixOpreator: CaseIterable {
    init?(rawValue: String)
}

enum DecimalPrefixOperator: String, PrefixOpreator {
    case unaryMinus = "-"
}

enum BinaryPrefixOperator: String, PrefixOpreator {
    case bitwiseNOT = "~"
    case unaryMinus = "-"
}
