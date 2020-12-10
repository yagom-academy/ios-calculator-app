//
//  Calculator.swift
//  Calculator
//
//  Created by 강인희 on 2020/12/09.
//

import Foundation

protocol BasicCalculator {
    var displayedValue: String { get }
    func calculate(value: String, by opreator: String)
    func reset()
}

