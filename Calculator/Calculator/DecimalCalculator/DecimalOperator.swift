//
//  DecimalType.swift
//  Calculator
//
//  Created by Yeon on 2020/12/09.
//

enum DecimalOperatorType: String, CaseIterable {
    case plus = "+"
    case minus = "-"
    case multiplication = "*"
    case division = "/"
}

enum DecimalOperatorPrecedence: Int {
    case high = 2
    case low = 1
}
