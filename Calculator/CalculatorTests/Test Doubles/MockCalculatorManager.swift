//
//  MockCalculatorManager.swift
//  CalculatorTests
//
//  Created by Jun Bang on 2021/11/25.
//

import Foundation
@testable import Calculator

struct MockCalculatorManager: Calculatable {
    func calculateResult(from historyStack: [String]) -> Double {
        let equationString = historyStack.filter { $0 != "" }
            .joined()
        var formula = ExpressionParser.parse(from: equationString)
        let result = getCalculationResult(from: &formula)
        return result
    }
    
    func getCalculationResult(from formula: inout Formula) -> Double {
        var result = 0.0
        do {
            try result = formula.result()
        } catch let error as CalculateItemQueueError {
            print(error.errorDescription)
        } catch {
            print(error)
        }
        return result
    }
}
