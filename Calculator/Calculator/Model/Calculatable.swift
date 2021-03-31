//
//  CalCulator.swift
//  Calculator
//
//  Created by 이영우 on 2021/03/22.
//
import Foundation

protocol Calculatable {
    func reset()
    func input(_ inputValue: String)
    func output()
    func calculate(currentOperator: String)
}
