//
//  MockCalculator.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/25.
//

import Foundation
@testable import Calculator

struct MockCalculator: Calculatable {
    var formulaStack: [String] = []
}
