//
//  Calculatable.swift
//  Calculator
//
//  Created by Jun Bang on 2021/11/25.
//

import Foundation

protocol Calculatable {
    func calculateResult(from historyStack: [String]) -> Double
    func getCalculationResult(from formula: inout Formula) -> Double
}
