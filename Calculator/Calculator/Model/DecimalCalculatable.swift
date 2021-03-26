//
//  DecimalCalculatable.swift
//  Calculator
//
//  Created by 이영우 on 2021/03/26.
//

import Foundation

protocol DecimalCalculatable: Calculatable {
    func infixCalculate(firstNumber: Double, operatorSymbol: String, secondNumber: Double) -> String
    func numberMoveToArray()
    func calculate(using stackTopOperator: String)
    func calculateHigherPrioritythan(_ input: String)
}
