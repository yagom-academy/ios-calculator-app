//
//  Formula.swift
//  Calculator
//
//  Created by Ari on 2021/11/11.
//

import Foundation

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Character>()
    
    mutating func result() -> Double {
        guard operands.count > 1, operands.front != nil else {
            operators.clear()
            operands.clear()
            return 0.0
        }
        var result: Double = 0
        do {
            result = try firstToCalculate()
        } catch let error as CalculatorError {
            print(error.description)
        } catch {
            print(error.localizedDescription)
        }
        guard operands.isEmpty == false else {
            return result
        }
        repeat {
            do {
                result = try calculateFromThrSecond(lhs: result)
            } catch let error as CalculatorError {
                print(error.description)
            } catch {
                print(error.localizedDescription)
            }
        } while operands.isEmpty == false
        if operators.isEmpty == false {
            operators.clear()
        }
        return result
    }
    
    private mutating func firstToCalculate() throws -> Double {
        let element = try operators.dequeue()
        guard let `operator` = Operator(rawValue: element) else {
            throw CalculatorError.wrongOperator
        }
        let lhs = try operands.dequeue()
        let rhs = try operands.dequeue()
        return `operator`.calculate(lhs: lhs, rhs: rhs)
    }
    
    private mutating func calculateFromThrSecond(lhs: Double) throws -> Double {
        let element = try operators.dequeue()
        guard let `operator` = Operator(rawValue: element) else {
            throw CalculatorError.wrongOperator
        }
        let rhs = try operands.dequeue()
        return `operator`.calculate(lhs: lhs, rhs: rhs)
    }
}
