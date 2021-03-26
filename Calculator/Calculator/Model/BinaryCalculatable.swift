//
//  BinaryCalculatable.swift
//  Calculator
//
//  Created by 이영우 on 2021/03/26.
//

import Foundation

protocol BinaryCalculatable: Calculatable {
    func calculate()
    func infixCalculate(firstNumber: UInt8, operatorSymbol: String, secondNumber: UInt8) -> String
    func popAllOperatorToList()
    func popHigherPrioritythan(_ input: String)
}
