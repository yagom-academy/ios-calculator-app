//
//  Calculatable.swift
//  Calculator
//
//  Created by 박병호 on 2021/11/25.
//

import Foundation

protocol Calculatable {
    var formulaStack: [String] { get set }
}

extension Calculatable {
    func calculateResult() -> Double {
        let equationString = formulaStack.filter { $0 != "" }
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
